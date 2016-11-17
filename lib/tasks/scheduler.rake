task :update_feed => :environment do
	require "instagram"

	# English Section
	Instagram.configure do |config|

	config.client_id = ENV['insta_client']

	config.access_token = ENV['insta_access']

	end

	@wwf_tweets = $client.search("from:WWFCanada", :result_type => "recent").take(25)
	@wwf_tweets_with_hashtag = @wwf_tweets.select { |tweet| tweet.text.include?('#CountForNature') }
	@wwf_tweets_with_hashtag.last(4).each_with_index do |tweet, index|
		index_plus_one = index + 1
		this_tweet = Tweet.where(id: index_plus_one).first_or_initialize
		this_tweet.update(text: tweet.text)
		this_tweet.save
		puts this_tweet.text
	end 

	@instas = Instagram.user_recent_media(@wwfcanada, {:count => 15})
	@instas_with_hashtag = @instas.select { |pic| pic.caption.try(:text).try(:include?, '#CountForNature') }
	@instas_with_hashtag.last(4).each_with_index do |insta, index|
		index_plus_one = index + 1
		this_insta = Insta.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.update({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.save
	end

	# French Section
	Instagram.configure do |config|

	config.client_id = ENV['fr_insta_client']

	config.access_token = ENV['fr_insta_access']

	end

	@fr_wwf_tweets = $client.search("from:WWFCanadaFR", :result_type => "recent").take(25)
	@fr_wwf_tweets_with_hashtag = @fr_wwf_tweets.select { |tweet| tweet.text.include?('#Plus1') }

	@fr_wwf_tweets_with_hashtag.last(4).each_with_index do |tweet, index|
		index_plus_one = index + 1
		this_tweet = FrTweet.where(id: index_plus_one).first_or_initialize
		this_tweet.update(text: tweet.text)
		this_tweet.save
		puts this_tweet.text
	end 

	@fr_instas = Instagram.user_recent_media(@wwfcanadafr, {:count => 15})
	@fr_instas_with_hashtag = @fr_instas.select { |pic| pic.caption.try(:text).try(:include?, '#Plus1') }
	puts @fr_instas_with_hashtag
	@fr_instas_with_hashtag.last(4).each_with_index do |insta, index|
		index_plus_one = index + 1
		this_insta = FrGram.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.update({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.save
	end  
	# puts Tweet.first.text
end
