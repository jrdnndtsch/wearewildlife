require 'rails_helper'

RSpec.describe "generic_stories/new", type: :view do
  before(:each) do
    assign(:generic_story, GenericStory.new(
      :title => "MyString",
      :short_description => "MyText",
      :link => "MyString"
    ))
  end

  it "renders new generic_story form" do
    render

    assert_select "form[action=?][method=?]", generic_stories_path, "post" do

      assert_select "input#generic_story_title[name=?]", "generic_story[title]"

      assert_select "textarea#generic_story_short_description[name=?]", "generic_story[short_description]"

      assert_select "input#generic_story_link[name=?]", "generic_story[link]"
    end
  end
end
