require 'rails_helper'

RSpec.describe "titles/new", type: :view do
  before(:each) do
    assign(:title, Title.new(
      :title => "MyString",
      :section_name => "MyString"
    ))
  end

  it "renders new title form" do
    render

    assert_select "form[action=?][method=?]", titles_path, "post" do

      assert_select "input#title_title[name=?]", "title[title]"

      assert_select "input#title_section_name[name=?]", "title[section_name]"
    end
  end
end
