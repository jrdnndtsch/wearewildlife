require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :title => "MyString",
      :author => "MyString",
      :short_description => "MyText",
      :link => "MyString",
      :video_link => "MyString"
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "input#blog_title[name=?]", "blog[title]"

      assert_select "input#blog_author[name=?]", "blog[author]"

      assert_select "textarea#blog_short_description[name=?]", "blog[short_description]"

      assert_select "input#blog_link[name=?]", "blog[link]"

      assert_select "input#blog_video_link[name=?]", "blog[video_link]"
    end
  end
end
