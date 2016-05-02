require 'rails_helper'

RSpec.describe "MainMenus", type: :request do
  describe "GET /main_menus" do
    it "works! (now write some real specs)" do
      get main_menus_path
      expect(response).to have_http_status(200)
    end
  end
end
