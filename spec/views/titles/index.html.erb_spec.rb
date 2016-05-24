require 'rails_helper'

RSpec.describe "titles/index", type: :view do
  before(:each) do
    assign(:titles, [
      Title.create!(
        :title => "Title",
        :section_name => "Section Name"
      ),
      Title.create!(
        :title => "Title",
        :section_name => "Section Name"
      )
    ])
  end

  it "renders a list of titles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Section Name".to_s, :count => 2
  end
end
