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
	puts Tweet.first.text
end
