require 'rails_helper'

RSpec.describe "fr_blogs/index", type: :view do
  before(:each) do
    assign(:fr_blogs, [
      FrBlog.create!(
        :title => "Title",
        :author => "Author",
        :short_description => "MyText",
        :link => "Link",
        :video_link => "Video Link",
        :approved => false,
        :image_url => "Image Url",
        :wp_id => 1,
        :photo_by => "Photo By"
      ),
      FrBlog.create!(
        :title => "Title",
        :author => "Author",
        :short_description => "MyText",
        :link => "Link",
        :video_link => "Video Link",
        :approved => false,
        :image_url => "Image Url",
        :wp_id => 1,
        :photo_by => "Photo By"
      )
    ])
  end

  it "renders a list of fr_blogs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Video Link".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Photo By".to_s, :count => 2
  end
end
