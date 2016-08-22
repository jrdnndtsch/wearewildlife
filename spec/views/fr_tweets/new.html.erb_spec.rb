require 'rails_helper'

RSpec.describe "fr_tweets/new", type: :view do
  before(:each) do
    assign(:fr_tweet, FrTweet.new(
      :text => "MyString"
    ))
  end

  it "renders new fr_tweet form" do
    render

    assert_select "form[action=?][method=?]", fr_tweets_path, "post" do

      assert_select "input#fr_tweet_text[name=?]", "fr_tweet[text]"
    end
  end
end
