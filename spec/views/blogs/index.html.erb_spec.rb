require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :title => "Title",
        :author => "Author",
        :short_description => "MyText",
        :link => "Link",
        :video_link => "Video Link"
      ),
      Blog.create!(
        :title => "Title",
        :author => "Author",
        :short_description => "MyText",
        :link => "Link",
        :video_link => "Video Link"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Video Link".to_s, :count => 2
  end
end
