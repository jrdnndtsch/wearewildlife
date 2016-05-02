require "rails_helper"

RSpec.describe GenericStoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/generic_stories").to route_to("generic_stories#index")
    end

    it "routes to #new" do
      expect(:get => "/generic_stories/new").to route_to("generic_stories#new")
    end

    it "routes to #show" do
      expect(:get => "/generic_stories/1").to route_to("generic_stories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/generic_stories/1/edit").to route_to("generic_stories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/generic_stories").to route_to("generic_stories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/generic_stories/1").to route_to("generic_stories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/generic_stories/1").to route_to("generic_stories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/generic_stories/1").to route_to("generic_stories#destroy", :id => "1")
    end

  end
end
