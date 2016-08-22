require 'rails_helper'

RSpec.describe "fr_blogs/edit", type: :view do
  before(:each) do
    @fr_blog = assign(:fr_blog, FrBlog.create!(
      :title => "MyString",
      :author => "MyString",
      :short_description => "MyText",
      :link => "MyString",
      :video_link => "MyString",
      :approved => false,
      :image_url => "MyString",
      :wp_id => 1,
      :photo_by => "MyString"
    ))
  end

  it "renders the edit fr_blog form" do
    render

    assert_select "form[action=?][method=?]", fr_blog_path(@fr_blog), "post" do

      assert_select "input#fr_blog_title[name=?]", "fr_blog[title]"

      assert_select "input#fr_blog_author[name=?]", "fr_blog[author]"

      assert_select "textarea#fr_blog_short_description[name=?]", "fr_blog[short_description]"

      assert_select "input#fr_blog_link[name=?]", "fr_blog[link]"

      assert_select "input#fr_blog_video_link[name=?]", "fr_blog[video_link]"

      assert_select "input#fr_blog_approved[name=?]", "fr_blog[approved]"

      assert_select "input#fr_blog_image_url[name=?]", "fr_blog[image_url]"

      assert_select "input#fr_blog_wp_id[name=?]", "fr_blog[wp_id]"

      assert_select "input#fr_blog_photo_by[name=?]", "fr_blog[photo_by]"
    end
  end
end
