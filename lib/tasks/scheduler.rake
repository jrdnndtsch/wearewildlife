task :update_feed => :environment do
	@wwf_tweets = $client.search("from:WWFCanada", :result_type => "recent").take(25)
	@wwf_tweets_with_hashtag = @wwf_tweets.select { |tweet| tweet.text.include?('#OceanSummit') }

	@wwf_tweets_with_hashtag.last(5).each_with_index do |tweet, index|
		index_plus_one = index + 1
		this_tweet = Tweet.where(id: index_plus_one).first_or_initialize
		this_tweet.update(text: tweet.text)
		this_tweet.save
		puts this_tweet.text
	end 

	@instas = Instagram.user_recent_media(@wwfcanada, {:count => 15})
	@instas_with_hashtag = @instas.select { |pic| pic.caption.text.include?('#doubletigers') }
	@instas_with_hashtag.last(5).each_with_index do |insta, index|
		index_plus_one = index + 1
		this_insta = Insta.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.update({text: insta.caption.text, image_url: insta.images.standard_resolution.url})
		this_insta.save
	end  
	puts Tweet.first.text
end
