require 'rails_helper'

RSpec.describe "FeaturedDonors", type: :request do
  describe "GET /featured_donors" do
    it "works! (now write some real specs)" do
      get featured_donors_path
      expect(response).to have_http_status(200)
    end
  end
end
