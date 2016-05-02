require 'rails_helper'

RSpec.describe "main_menus/index", type: :view do
  before(:each) do
    assign(:main_menus, [
      MainMenu.create!(
        :title => "Title",
        :link => "Link"
      ),
      MainMenu.create!(
        :title => "Title",
        :link => "Link"
      )
    ])
  end

  it "renders a list of main_menus" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
