require 'rails_helper'

RSpec.describe "SubMenus", type: :request do
  describe "GET /sub_menus" do
    it "works! (now write some real specs)" do
      get sub_menus_path
      expect(response).to have_http_status(200)
    end
  end
end
