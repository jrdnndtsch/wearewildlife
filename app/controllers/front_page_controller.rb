class FrontPageController < ApplicationController
	skip_before_action :authenticate_user!

	require 'rinku'
	# require 'HTTParty'
    require 'json'

  def show
  	@main_menus = MainMenu.all
  	@header = Header.last
  	@featured_story = Story.is_featured.first
  	@stories = Story.are_selected.are_not_featured.last(7).reverse
    @tweets = Tweet.last(5)
    @instagrams = Insta.last(5)
    @socials = []
    (0..4).each do |i|
      @socials << @tweets[i]
      @socials << @instagrams[i]
    end

    @title_blog = Title.where("section_name = 'blog'").first
    @stories_title = Title.where("section_name = 'stories'").first
    @generic_stories_title = Title.where("section_name = 'generic_stories'").first

    # raise 'the roof'
    @blogs = Blog.are_approved.order(date: :DESC).first(3)
  	@featured_donor = FeaturedDonor.is_featured.first
  	@generic_stories = GenericStory.are_selected.last(3).reverse
  	# @instagram = Instagram.user_recent_media(@deartrudence, {:count => 15})
  	# @instwogram = Instagram.user_recent_media(@deartrudence, {:count => 15}).select { |pic| pic.caption.text.include?('#Repost')}
  	# @instwogram_count = Instagram.user_recent_media(@deartrudence).count { |pic| pic.caption.text.include?('#Repost')}

  	# @tweets = $client.user_timeline[0..4]
  	# @jb = $client.search("from:WWFCanada", :result_type => "recent").take(50)
  	# @jb_count_with_hashtag = @jb.count {|tweet| tweet.text.include?('#ExploreTheSound') }
  	# @jb_with_hashtag = @jb.select { |tweet| tweet.text.include?('#ExploreTheSound') }

  	client_key = ENV['client_key']
  	client_secret = ENV['client_secret']
  	oauth_token = ENV['oauth_token']
  	oauth_token_secret = ENV['oauth_token_secret']
  	method = 'GET'
  	uri = 'http://blog.wwf.ca/wp-json/wp/v2/posts'
  	image_uri = 'http://jordandeutsch.com/wp-json/wp/v2/media/24'
  	
  	# Steps for OAuth

  	# use consumer_key and consumer_secret and send to /oauth1/request (GET)
  	#get back oauth_token and oauth_secret (temporary)

  	#add consumer key to params
  
  	#add oauth_signature to params
  	# params['oauth_signature'] = url_encode(sign(signing_key, image_signature_base_string))

  	#create the authorization header
  	# header_string = header(params)
    # image_header_string = header(params)
  	#get those temporary token
    # response_request = make_request(method, uri, client_key, oauth_token, oauth_token_secret, client_secret)
    # image_request = make_request(method, image_uri, client_key, oauth_token, oauth_token_secret, client_secret)
  	# response = request_data(response_request, uri, method)
    # image = request_data(image_request, image_uri, method)
    # @response = JSON.parse(response)
    # @image = JSON.parse(image)

  end
    # in browser got to oauth1/authosrize3
  	# in browser got to url/oauth1/access?oauth_token and oauth_secret to get oauth_verifier

  	# use consumer_key , consumer_secret, oauth_token(temporary), and oauth_secret(temporary) in Authorization header AND oauth_verifier in the request and send to /oauth1/access?oauth_verifier=
  	#get back oauth_token and oauth_secret (permanent) 

  	#GET data send request to endpoint wp-json/wp/v2/ with consumer_key consumer_secret oauth_key (permanent), oauth_secret(permanent)

  	# headers = {'Authorization' =>}
  	# @response = HTTParty.get('http://jordandeutsch.com/wp-json/wp/v2/posts/106?oauth_consumer_key=hZRYr39SFyYW&oauth_token=1OicIxJ0cimikraxauBCxTKQ&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1462463037&oauth_nonce=0xVtJT&oauth_version=1.0&oauth_signature=hsqRc4GS22FItTC4PKUQ5SaxBU0=')
  	

  	# Setup data
  	# method = :get
  	# domain_url = 'http://jordandeutsch.com/oauth1/request?'
  	# oauth_config = { consumer_key: ENV['client_key'], consumer_secret: ENV['client_secret'] }
  	# key = ENV['client_key']
  	# secret = ENV['client_secret']
  	# @callback_url = 'http://jordandeutsch.com/'

  	# @consumer = OAuth::Consumer.new( key, secret, :site => domain_url)
  	# @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)

  	# session[:token] = request_token.token
  	# session[:token_secret] = request_token.secret
  	# redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
  	# @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site=>'http://my.site'})
  	# Usage
  	# oauth = OAuth::Consumer.new(method, domain_url, oauth_config)

  	# Returns
  	# oauth.signature_base # Returns the signature appended in the auth url
  	# oauth.full_url       # The proper url used for authentication
  	

  private 

	def generate_nonce(size=7)
	  Base64.encode64(OpenSSL::Random.random_bytes(size)).gsub(/\W/, '')
	end

	def params(client_key, oauth_token, nonce)
	  params = {
	    'oauth_consumer_key' => client_key, # Your consumer key
	    'oauth_nonce' => nonce, # A random string, see below for function
	    'oauth_signature_method' => 'HMAC-SHA1', # How you'll be signing (see later)
	    'oauth_timestamp' => Time.now.getutc.to_i.to_s, # Timestamp
	    'oauth_version' => '1.0',# oAuth version
	    'oauth_token' => oauth_token
	  }
	end

	def signature_base_string(method, uri, params)
	  # Join up the parameters into one long URL-safe string of key value pairs
	  encoded_params = params.sort.collect{ |k, v| url_encode("#{k}=#{v}") }.join('%26')
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
	def header(params)
	  header = "OAuth "
	  params.each do |k, v|
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
	  params = params(client_key, oauth_token, generate_nonce)
	  params['oauth_consumer_key'] = client_key
	  params['oauth_token'] = oauth_token
	  params['oauth_nonce'] = generate_nonce
	  signing_key = client_secret + '&' + access_token
	# create this for the oauth_signature
	  signature_base_string = signature_base_string(method, uri, params)
	  params['oauth_signature'] = url_encode(sign(signing_key, signature_base_string))
	  header_string = header(params)
	  return header_string
	end
end
