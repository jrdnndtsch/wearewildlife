require 'rails_helper'

RSpec.describe "FrGrams", type: :request do
  describe "GET /fr_grams" do
    it "works! (now write some real specs)" do
      get fr_grams_path
      expect(response).to have_http_status(200)
    end
  end
end
