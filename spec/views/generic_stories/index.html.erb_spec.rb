require 'rails_helper'

RSpec.describe "generic_stories/index", type: :view do
  before(:each) do
    assign(:generic_stories, [
      GenericStory.create!(
        :title => "Title",
        :short_description => "MyText",
        :link => "Link"
      ),
      GenericStory.create!(
        :title => "Title",
        :short_description => "MyText",
        :link => "Link"
      )
    ])
  end

  it "renders a list of generic_stories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
