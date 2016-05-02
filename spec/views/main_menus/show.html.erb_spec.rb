require 'rails_helper'

RSpec.describe "main_menus/show", type: :view do
  before(:each) do
    @main_menu = assign(:main_menu, MainMenu.create!(
      :title => "Title",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Link/)
  end
end
