class Admin::BlogsController < AdminController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit

  include UpdatedBy

  def upload  
    raise "the roof"
    @instas = Instagram.user_recent_media(@deartrudence, {:count => 15})
    @instas_with_hashtag = @instas.select { |pic| pic.caption.text.include?('#Repost') }
    @instas_with_hashtag.last(5).each_with_index do |insta, index|
      index_plus_one = index + 1
      this_insta = Insta.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, imag_url: insta.images.standard_resolution.url})
      this_insta.save
    end 
    render nothing: true, status: :ok, content_type: "text/html"
  end

  # GET /blogs
  # GET /blogs.json
  def index
    add_breadcrumb "blog", 'blogs'
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @updated_by = model_updated_by_user(@blog)
  end

  # GET /blogs/new
  def new
    add_breadcrumb "blog", "/admin/blogs"
    add_breadcrumb "new" , "#"
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    add_breadcrumb "blog", "/admin/blogs"
    add_breadcrumb @blog.title, "#"
    add_breadcrumb "edit", "#"
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to edit_admin_blog_path(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to edit_admin_blog_path(@blog), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_path, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :author, :date, :short_description, :link, :video_link, :photo, :approved)
    end
end
