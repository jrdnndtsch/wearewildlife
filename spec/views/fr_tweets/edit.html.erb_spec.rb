require 'rails_helper'

RSpec.describe "fr_tweets/edit", type: :view do
  before(:each) do
    @fr_tweet = assign(:fr_tweet, FrTweet.create!(
      :text => "MyString"
    ))
  end

  it "renders the edit fr_tweet form" do
    render

    assert_select "form[action=?][method=?]", fr_tweet_path(@fr_tweet), "post" do

      assert_select "input#fr_tweet_text[name=?]", "fr_tweet[text]"
    end
  end
end
