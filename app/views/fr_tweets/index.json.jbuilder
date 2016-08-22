json.array!(@fr_tweets) do |fr_tweet|
  json.extract! fr_tweet, :id, :text
  json.url fr_tweet_url(fr_tweet, format: :json)
end
