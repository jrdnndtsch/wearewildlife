require 'rails_helper'

RSpec.describe "fr_grams/index", type: :view do
  before(:each) do
    assign(:fr_grams, [
      FrGram.create!(
        :image_url => "Image Url",
        :text => "Text"
      ),
      FrGram.create!(
        :image_url => "Image Url",
        :text => "Text"
      )
    ])
  end

  it "renders a list of fr_grams" do
    render
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
