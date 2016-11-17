class FrontPageController < ApplicationController
	skip_before_action :authenticate_user!

	require 'rinku'
  require 'json'

  def show
  	@main_menus = MainMenu.all
  	@header = Header.last
  	@featured_story = Story.is_featured.first
  	@stories = Story.are_selected.are_not_featured.order(date: :desc).first(7)
    @tweets = Tweet.last(4)
    @instagrams = Insta.last(4)
    @socials = []
    (0..3).each do |i|
      @socials << @tweets[i]
      @socials << @instagrams[i]
    end

    @title_blog = Title.where("section_name = 'blog'").first
    @stories_title = Title.where("section_name = 'stories'").first
    @generic_stories_title = Title.where("section_name = 'generic_stories'").first

    @blogs = Blog.are_approved.order(date: :DESC).first(3)
  	@featured_donor = FeaturedDonor.is_featured.first
  	@generic_stories = GenericStory.are_selected.last(3).reverse

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

  def fr_show
    @main_menus = MainMenu.all
    @header = Header.last
    @featured_story = Story.is_featured.first
    @stories = Story.are_selected.are_not_featured.order(date: :desc).first(7)
    @tweets = FrTweet.last(4)
    @instagrams = FrGram.last(4)
    @socials = []
    (0..3).each do |i|
      @socials << @tweets[i]
      @socials << @instagrams[i]
    end

    @title_blog = Title.where("section_name = 'fr_blog'").first
    @stories_title = Title.where("section_name = 'stories'").first
    @generic_stories_title = Title.where("section_name = 'generic_stories'").first

    @blogs = FrBlog.are_approved.order(date: :DESC).first(3)
    @featured_donor = FeaturedDonor.is_featured.first
    @generic_stories = GenericStory.are_selected.last(3).reverse

    client_key = ENV['fr_client_key']
    client_secret = ENV['fr_client_secret']
    oauth_token = ENV['fr_oauth_token']
    oauth_token_secret = ENV['fr_oauth_token_secret']
    method = 'GET'
    uri = 'http://blog.wwf.ca/fr/wp-json/wp/v2/posts'
    image_uri = 'http://jordandeutsch.com/wp-json/wp/v2/media/24'
  end
  	

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
