require 'rails_helper'

RSpec.describe "stories/show", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :title => "Title",
      :location => "Location",
      :link => "Link",
      :description => "MyText",
      :featured => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
