require 'rails_helper'

RSpec.describe "titles/show", type: :view do
  before(:each) do
    @title = assign(:title, Title.create!(
      :title => "Title",
      :section_name => "Section Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Section Name/)
  end
end
