require "rails_helper"

RSpec.describe FeaturedDonorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/featured_donors").to route_to("featured_donors#index")
    end

    it "routes to #new" do
      expect(:get => "/featured_donors/new").to route_to("featured_donors#new")
    end

    it "routes to #show" do
      expect(:get => "/featured_donors/1").to route_to("featured_donors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/featured_donors/1/edit").to route_to("featured_donors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/featured_donors").to route_to("featured_donors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/featured_donors/1").to route_to("featured_donors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/featured_donors/1").to route_to("featured_donors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/featured_donors/1").to route_to("featured_donors#destroy", :id => "1")
    end

  end
end
