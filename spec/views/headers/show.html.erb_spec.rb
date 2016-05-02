require 'rails_helper'

RSpec.describe "headers/show", type: :view do
  before(:each) do
    @header = assign(:header, Header.create!(
      :number => 1,
      :tag_line => "Tag Line",
      :about => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Tag Line/)
    expect(rendered).to match(/MyText/)
  end
end
