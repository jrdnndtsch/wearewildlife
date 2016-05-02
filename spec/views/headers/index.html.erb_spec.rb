require 'rails_helper'

RSpec.describe "headers/index", type: :view do
  before(:each) do
    assign(:headers, [
      Header.create!(
        :number => 1,
        :tag_line => "Tag Line",
        :about => "MyText"
      ),
      Header.create!(
        :number => 1,
        :tag_line => "Tag Line",
        :about => "MyText"
      )
    ])
  end

  it "renders a list of headers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Tag Line".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
