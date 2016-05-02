require 'rails_helper'

RSpec.describe "sub_menus/show", type: :view do
  before(:each) do
    @sub_menu = assign(:sub_menu, SubMenu.create!(
      :title => "Title",
      :link => "Link",
      :main_menu => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(//)
  end
end
