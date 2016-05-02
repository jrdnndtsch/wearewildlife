require "rails_helper"

RSpec.describe SubMenusController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_menus").to route_to("sub_menus#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_menus/new").to route_to("sub_menus#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_menus/1").to route_to("sub_menus#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_menus/1/edit").to route_to("sub_menus#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_menus").to route_to("sub_menus#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sub_menus/1").to route_to("sub_menus#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sub_menus/1").to route_to("sub_menus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_menus/1").to route_to("sub_menus#destroy", :id => "1")
    end

  end
end
