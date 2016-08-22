require 'rails_helper'

RSpec.describe "FrTweets", type: :request do
  describe "GET /fr_tweets" do
    it "works! (now write some real specs)" do
      get fr_tweets_path
      expect(response).to have_http_status(200)
    end
  end
end
