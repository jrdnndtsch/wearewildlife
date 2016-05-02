require 'rails_helper'

RSpec.describe "featured_donors/edit", type: :view do
  before(:each) do
    @featured_donor = assign(:featured_donor, FeaturedDonor.create!(
      :short_description => "MyString",
      :link => "MyString"
    ))
  end

  it "renders the edit featured_donor form" do
    render

    assert_select "form[action=?][method=?]", featured_donor_path(@featured_donor), "post" do

      assert_select "input#featured_donor_short_description[name=?]", "featured_donor[short_description]"

      assert_select "input#featured_donor_link[name=?]", "featured_donor[link]"
    end
  end
end
