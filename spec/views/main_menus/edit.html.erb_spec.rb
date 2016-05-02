require 'rails_helper'

RSpec.describe "main_menus/edit", type: :view do
  before(:each) do
    @main_menu = assign(:main_menu, MainMenu.create!(
      :title => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit main_menu form" do
    render

    assert_select "form[action=?][method=?]", main_menu_path(@main_menu), "post" do

      assert_select "input#main_menu_title[name=?]", "main_menu[title]"

      assert_select "input#main_menu_link[name=?]", "main_menu[link]"
    end
  end
end
