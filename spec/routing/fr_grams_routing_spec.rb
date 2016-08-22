require "rails_helper"

RSpec.describe FrGramsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fr_grams").to route_to("fr_grams#index")
    end

    it "routes to #new" do
      expect(:get => "/fr_grams/new").to route_to("fr_grams#new")
    end

    it "routes to #show" do
      expect(:get => "/fr_grams/1").to route_to("fr_grams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fr_grams/1/edit").to route_to("fr_grams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fr_grams").to route_to("fr_grams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fr_grams/1").to route_to("fr_grams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fr_grams/1").to route_to("fr_grams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fr_grams/1").to route_to("fr_grams#destroy", :id => "1")
    end

  end
end
