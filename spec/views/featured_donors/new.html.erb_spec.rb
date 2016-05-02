require 'rails_helper'

RSpec.describe "featured_donors/new", type: :view do
  before(:each) do
    assign(:featured_donor, FeaturedDonor.new(
      :short_description => "MyString",
      :link => "MyString"
    ))
  end

  it "renders new featured_donor form" do
    render

    assert_select "form[action=?][method=?]", featured_donors_path, "post" do

      assert_select "input#featured_donor_short_description[name=?]", "featured_donor[short_description]"

      assert_select "input#featured_donor_link[name=?]", "featured_donor[link]"
    end
  end
end
