require 'rails_helper'

RSpec.describe "headers/edit", type: :view do
  before(:each) do
    @header = assign(:header, Header.create!(
      :number => 1,
      :tag_line => "MyString",
      :about => "MyText"
    ))
  end

  it "renders the edit header form" do
    render

    assert_select "form[action=?][method=?]", header_path(@header), "post" do

      assert_select "input#header_number[name=?]", "header[number]"

      assert_select "input#header_tag_line[name=?]", "header[tag_line]"

      assert_select "textarea#header_about[name=?]", "header[about]"
    end
  end
end
