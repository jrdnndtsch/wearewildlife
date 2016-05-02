require 'rails_helper'

RSpec.describe "sub_menus/new", type: :view do
  before(:each) do
    assign(:sub_menu, SubMenu.new(
      :title => "MyString",
      :link => "MyString",
      :main_menu => nil
    ))
  end

  it "renders new sub_menu form" do
    render

    assert_select "form[action=?][method=?]", sub_menus_path, "post" do

      assert_select "input#sub_menu_title[name=?]", "sub_menu[title]"

      assert_select "input#sub_menu_link[name=?]", "sub_menu[link]"

      assert_select "input#sub_menu_main_menu_id[name=?]", "sub_menu[main_menu_id]"
    end
  end
end
