require 'rails_helper'

RSpec.describe "fr_tweets/index", type: :view do
  before(:each) do
    assign(:fr_tweets, [
      FrTweet.create!(
        :text => "Text"
      ),
      FrTweet.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of fr_tweets" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
