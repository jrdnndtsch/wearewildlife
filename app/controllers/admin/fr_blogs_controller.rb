class Admin::FrBlogsController < AdminController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
    before_filter :set_paper_trail_whodunnit

    include UpdatedBy

    def upload  
      # raise "the roof"
        # all required keys for request
        client_key = ENV['fr_client_key']
        client_secret = ENV['fr_client_secret']
        oauth_token = ENV['fr_oauth_token']
        oauth_token_secret = ENV['fr_oauth_token_secret']
        method = 'GET'
        uri = 'http://blog.wwf.ca/fr/wp-json/wp/v2/posts'
        # image_uri = 'http://jordandeutsch.com/wp-json/wp/v2/media/24'
        

        response_request = make_request(method, uri, client_key, oauth_token, oauth_token_secret, client_secret)
        response = request_data(response_request, uri, method)
        @response = JSON.parse(response)
        @response.each do |blog|
          wp_id = blog['id']
          date = blog['date']
          title = blog['title']['rendered']
          link = blog['link']
          excerpt = blog['excerpt']['rendered']
          new_blog = FrBlog.where(wp_id: wp_id).first_or_create({title: title, date: date, short_description: excerpt, link: link})
          if blog['_links']['https://api.w.org/featuredmedia'].present?
            image_uri = blog['_links']['https://api.w.org/featuredmedia'][0]['href']
            image_request = make_request(method, image_uri, client_key, oauth_token, oauth_token_secret, client_secret)
            image = request_data(image_request, image_uri, method)
            @image = JSON.parse(image)
            image_source_url = @image['source_url']
            new_blog.update(image_url: image_source_url)
          end
          if blog['_links']['wp:featuredmedia'].present?
            image_uri = blog['_links']['wp:featuredmedia'][0]['href']
            image_request = make_request(method, image_uri, client_key, oauth_token, oauth_token_secret, client_secret)
            image = request_data(image_request, image_uri, method)
            @image = JSON.parse(image)
            image_source_url = @image['source_url']
            new_blog.update(image_url: image_source_url)
          end
          if blog['_links']['author'].present?
            author_uri = blog['_links']['author'][0]['href']
            author_request = make_request(method, author_uri, client_key, oauth_token, oauth_token_secret, client_secret)
            author = request_data(author_request, author_uri, method)
            @author = JSON.parse(author)
            author_name = @author['name']
            new_blog.update(author: author_name)
          end
        end
      # @instas = Instagram.user_recent_media(@deartrudence, {:count => 15})
      # @instas_with_hashtag = @instas.select { |pic| pic.caption.text.include?('#Repost') }
      # @instas_with_hashtag.last(5).each_with_index do |insta, index|
      #   index_plus_one = index + 1
      #   this_insta = Insta.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, imag_url: insta.images.standard_resolution.url})
      #   this_insta.save
      # end 
      @title = Title.where("section_name = 'blog'")
      @fr_blogs = FrBlog.all
      redirect_to admin_fr_blogs_path, :locals => {:title => @title, :blogs => @fr_blogs} 
    end

    # GET /blogs
    # GET /blogs.json
    def index
      add_breadcrumb "blog", 'blogs'
      @fr_blogs = FrBlog.all.order(date: :DESC)
      
      @title = Title.where("section_name = 'fr_blog'")
      if params[:title_thing].present?
        @the_title = Title.find(params[:title_thing])
        @the_title.update(title: params[:title])
      end
    end

    # GET /blogs/1
    # GET /blogs/1.json
    def show
      
    end

    # GET /blogs/new
    def new
      add_breadcrumb "blog", "/admin/blogs"
      add_breadcrumb "new" , "#"
      @fr_blog = FrBlog.new
    end

    # GET /blogs/1/edit
    def edit
      @updated_by = model_updated_by_user(@fr_blog)
      add_breadcrumb "blog", "/admin/blogs"
      add_breadcrumb @fr_blog.title, "#"
      add_breadcrumb "edit", "#"
    end

    # POST /blogs
    # POST /blogs.json
    def create
      @fr_blog = FrBlog.new(fr_blog_params)

      respond_to do |format|
        if @fr_blog.save
          format.html { redirect_to edit_admin_fr_blog_path(@fr_blog), notice: 'Blog was successfully created.' }
          format.json { render :show, status: :created, location: @fr_blog }
        else
          format.html { render :new }
          format.json { render json: @fr_blog.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blogs/1
    # PATCH/PUT /blogs/1.json
    def update
      respond_to do |format|
        if @fr_blog.update(fr_blog_params)
          if params[:remove_photo].present?
            @fr_blog.update(photo: nil)
          end
          format.html { redirect_to edit_admin_fr_blog_path(@fr_blog), notice: 'Blog was successfully updated.' }
          format.json { render :show, status: :ok, location: @fr_blog }
        else
          format.html { render :edit }
          format.json { render json: @fr_blog.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blogs/1
    # DELETE /blogs/1.json
    def destroy
      @fr_blog.destroy
      respond_to do |format|
        format.html { redirect_to admin_fr_blogs_path, notice: 'Blog was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_blog
        @fr_blog = FrBlog.find(params[:id])
      end

      private 

      def generate_nonce(size=7)
        Base64.encode64(OpenSSL::Random.random_bytes(size)).gsub(/\W/, '')
      end

      def wp_params(client_key, oauth_token, nonce)
        wp_params = {
          'oauth_consumer_key' => client_key, # Your consumer key
          'oauth_nonce' => nonce, # A random string, see below for function
          'oauth_signature_method' => 'HMAC-SHA1', # How you'll be signing (see later)
          'oauth_timestamp' => Time.now.getutc.to_i.to_s, # Timestamp
          'oauth_version' => '1.0',# oAuth version
          'oauth_token' => oauth_token
        }
      end

      def signature_base_string(method, uri, wp_params)
        # Join up the parameters into one long URL-safe string of key value pairs
        encoded_params = wp_params.sort.collect{ |k, v| url_encode("#{k}=#{v}") }.join('%26')
        # Join the above with your method and URL-safe destination URL
        method + '&' + url_encode(uri) + '&' + encoded_params
      end

      def url_encode(string)
       CGI::escape(string)
      end

      # where sign is:
      def sign(key, base_string)
        digest = OpenSSL::Digest::Digest.new('sha1')
        hmac = OpenSSL::HMAC.digest(digest, key, base_string)
        Base64.encode64(hmac).chomp.gsub(/\n/, '')
      end

       # where header is:
      def header(wp_params)
        header = "OAuth "
        wp_params.each do |k, v|
          header += "#{k}=\"#{v}\", "
        end
        header.slice(0..-3) # chop off last ", "
      end


      # where request_data is
      def request_data(header, base_uri, method, post_data=nil)
        url = URI.parse(base_uri)
        http = Net::HTTP.new(url.host, 80) # set to 80 if not using HTTPS
        http.use_ssl = false # ignore if not using HTTPS
        if method == 'POST'
          # post_data here should be your encoded POST string, NOT an array
          resp, data = http.post(url.path, post_data, { 'Authorization' => header })
        else
          resp, data = http.get(url.to_s, { 'Authorization' => header })
        end
        resp.body
      end


      # access_token ||= '' # if not set, blank string


      def make_request(method, uri, client_key, oauth_token, oauth_token_secret, client_secret)
        access_token = oauth_token_secret
        wp_params = wp_params(client_key, oauth_token, generate_nonce)
        wp_params['oauth_consumer_key'] = client_key
        wp_params['oauth_token'] = oauth_token
        wp_params['oauth_nonce'] = generate_nonce
        signing_key = client_secret + '&' + access_token
      # create this for the oauth_signature
        signature_base_string = signature_base_string(method, uri, wp_params)
        wp_params['oauth_signature'] = url_encode(sign(signing_key, signature_base_string))
        header_string = header(wp_params)
        return header_string
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fr_blog_params
      params.require(:fr_blog).permit(:title, :author, :date, :short_description, :photo, :link, :video_link, :approved, :image_url, :wp_id, :photo_by)
    end
end
