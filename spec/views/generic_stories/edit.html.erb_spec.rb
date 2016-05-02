require 'rails_helper'

RSpec.describe "generic_stories/edit", type: :view do
  before(:each) do
    @generic_story = assign(:generic_story, GenericStory.create!(
      :title => "MyString",
      :short_description => "MyText",
      :link => "MyString"
    ))
  end

  it "renders the edit generic_story form" do
    render

    assert_select "form[action=?][method=?]", generic_story_path(@generic_story), "post" do

      assert_select "input#generic_story_title[name=?]", "generic_story[title]"

      assert_select "textarea#generic_story_short_description[name=?]", "generic_story[short_description]"

      assert_select "input#generic_story_link[name=?]", "generic_story[link]"
    end
  end
end
