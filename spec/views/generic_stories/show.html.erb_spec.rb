require 'rails_helper'

RSpec.describe "generic_stories/show", type: :view do
  before(:each) do
    @generic_story = assign(:generic_story, GenericStory.create!(
      :title => "Title",
      :short_description => "MyText",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Link/)
  end
end
