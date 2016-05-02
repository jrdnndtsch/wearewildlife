require "rails_helper"

RSpec.describe MainMenusController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/main_menus").to route_to("main_menus#index")
    end

    it "routes to #new" do
      expect(:get => "/main_menus/new").to route_to("main_menus#new")
    end

    it "routes to #show" do
      expect(:get => "/main_menus/1").to route_to("main_menus#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/main_menus/1/edit").to route_to("main_menus#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/main_menus").to route_to("main_menus#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/main_menus/1").to route_to("main_menus#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/main_menus/1").to route_to("main_menus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/main_menus/1").to route_to("main_menus#destroy", :id => "1")
    end

  end
end
