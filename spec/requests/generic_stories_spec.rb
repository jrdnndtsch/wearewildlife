require 'rails_helper'

RSpec.describe "GenericStories", type: :request do
  describe "GET /generic_stories" do
    it "works! (now write some real specs)" do
      get generic_stories_path
      expect(response).to have_http_status(200)
    end
  end
end
