require 'rails_helper'

RSpec.describe "fr_tweets/show", type: :view do
  before(:each) do
    @fr_tweet = assign(:fr_tweet, FrTweet.create!(
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
  end
end
