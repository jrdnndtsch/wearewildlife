require "rails_helper"

RSpec.describe FrBlogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fr_blogs").to route_to("fr_blogs#index")
    end

    it "routes to #new" do
      expect(:get => "/fr_blogs/new").to route_to("fr_blogs#new")
    end

    it "routes to #show" do
      expect(:get => "/fr_blogs/1").to route_to("fr_blogs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fr_blogs/1/edit").to route_to("fr_blogs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fr_blogs").to route_to("fr_blogs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fr_blogs/1").to route_to("fr_blogs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fr_blogs/1").to route_to("fr_blogs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fr_blogs/1").to route_to("fr_blogs#destroy", :id => "1")
    end

  end
end
