require 'rails_helper'

RSpec.describe "FrBlogs", type: :request do
  describe "GET /fr_blogs" do
    it "works! (now write some real specs)" do
      get fr_blogs_path
      expect(response).to have_http_status(200)
    end
  end
end
