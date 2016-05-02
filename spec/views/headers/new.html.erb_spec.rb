require 'rails_helper'

RSpec.describe "headers/new", type: :view do
  before(:each) do
    assign(:header, Header.new(
      :number => 1,
      :tag_line => "MyString",
      :about => "MyText"
    ))
  end

  it "renders new header form" do
    render

    assert_select "form[action=?][method=?]", headers_path, "post" do

      assert_select "input#header_number[name=?]", "header[number]"

      assert_select "input#header_tag_line[name=?]", "header[tag_line]"

      assert_select "textarea#header_about[name=?]", "header[about]"
    end
  end
end
