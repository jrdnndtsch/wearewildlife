require 'rails_helper'

RSpec.describe "sub_menus/index", type: :view do
  before(:each) do
    assign(:sub_menus, [
      SubMenu.create!(
        :title => "Title",
        :link => "Link",
        :main_menu => nil
      ),
      SubMenu.create!(
        :title => "Title",
        :link => "Link",
        :main_menu => nil
      )
    ])
  end

  it "renders a list of sub_menus" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
