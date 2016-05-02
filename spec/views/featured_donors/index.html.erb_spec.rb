require 'rails_helper'

RSpec.describe "featured_donors/index", type: :view do
  before(:each) do
    assign(:featured_donors, [
      FeaturedDonor.create!(
        :short_description => "Short Description",
        :link => "Link"
      ),
      FeaturedDonor.create!(
        :short_description => "Short Description",
        :link => "Link"
      )
    ])
  end

  it "renders a list of featured_donors" do
    render
    assert_select "tr>td", :text => "Short Description".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
