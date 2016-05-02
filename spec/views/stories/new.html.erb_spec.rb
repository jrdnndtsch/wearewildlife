require 'rails_helper'

RSpec.describe "stories/new", type: :view do
  before(:each) do
    assign(:story, Story.new(
      :title => "MyString",
      :location => "MyString",
      :link => "MyString",
      :description => "MyText",
      :featured => false
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_location[name=?]", "story[location]"

      assert_select "input#story_link[name=?]", "story[link]"

      assert_select "textarea#story_description[name=?]", "story[description]"

      assert_select "input#story_featured[name=?]", "story[featured]"
    end
  end
end
