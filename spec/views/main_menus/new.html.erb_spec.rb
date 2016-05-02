require 'rails_helper'

RSpec.describe "main_menus/new", type: :view do
  before(:each) do
    assign(:main_menu, MainMenu.new(
      :title => "MyString",
      :link => "MyString"
    ))
  end

  it "renders new main_menu form" do
    render

    assert_select "form[action=?][method=?]", main_menus_path, "post" do

      assert_select "input#main_menu_title[name=?]", "main_menu[title]"

      assert_select "input#main_menu_link[name=?]", "main_menu[link]"
    end
  end
end
