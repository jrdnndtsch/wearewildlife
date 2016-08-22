require "rails_helper"

RSpec.describe FrTweetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fr_tweets").to route_to("fr_tweets#index")
    end

    it "routes to #new" do
      expect(:get => "/fr_tweets/new").to route_to("fr_tweets#new")
    end

    it "routes to #show" do
      expect(:get => "/fr_tweets/1").to route_to("fr_tweets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fr_tweets/1/edit").to route_to("fr_tweets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fr_tweets").to route_to("fr_tweets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fr_tweets/1").to route_to("fr_tweets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fr_tweets/1").to route_to("fr_tweets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fr_tweets/1").to route_to("fr_tweets#destroy", :id => "1")
    end

  end
end
