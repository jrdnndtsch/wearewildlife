require 'rails_helper'

RSpec.describe "sub_menus/edit", type: :view do
  before(:each) do
    @sub_menu = assign(:sub_menu, SubMenu.create!(
      :title => "MyString",
      :link => "MyString",
      :main_menu => nil
    ))
  end

  it "renders the edit sub_menu form" do
    render

    assert_select "form[action=?][method=?]", sub_menu_path(@sub_menu), "post" do

      assert_select "input#sub_menu_title[name=?]", "sub_menu[title]"

      assert_select "input#sub_menu_link[name=?]", "sub_menu[link]"

      assert_select "input#sub_menu_main_menu_id[name=?]", "sub_menu[main_menu_id]"
    end
  end
end
