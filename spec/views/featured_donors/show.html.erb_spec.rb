require 'rails_helper'

RSpec.describe "featured_donors/show", type: :view do
  before(:each) do
    @featured_donor = assign(:featured_donor, FeaturedDonor.create!(
      :short_description => "Short Description",
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Description/)
    expect(rendered).to match(/Link/)
  end
end
