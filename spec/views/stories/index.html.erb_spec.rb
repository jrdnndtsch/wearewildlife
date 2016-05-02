require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :title => "Title",
        :location => "Location",
        :link => "Link",
        :description => "MyText",
        :featured => false
      ),
      Story.create!(
        :title => "Title",
        :location => "Location",
        :link => "Link",
        :description => "MyText",
        :featured => false
      )
    ])
  end

  it "renders a list of stories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
