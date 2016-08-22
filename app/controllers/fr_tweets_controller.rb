class FrTweetsController < ApplicationController
  before_action :set_fr_tweet, only: [:show, :edit, :update, :destroy]

  # GET /fr_tweets
  # GET /fr_tweets.json
  def index
    @fr_tweets = FrTweet.all
  end

  # GET /fr_tweets/1
  # GET /fr_tweets/1.json
  def show
  end

  # GET /fr_tweets/new
  def new
    @fr_tweet = FrTweet.new
  end

  # GET /fr_tweets/1/edit
  def edit
  end

  # POST /fr_tweets
  # POST /fr_tweets.json
  def create
    @fr_tweet = FrTweet.new(fr_tweet_params)

    respond_to do |format|
      if @fr_tweet.save
        format.html { redirect_to @fr_tweet, notice: 'Fr tweet was successfully created.' }
        format.json { render :show, status: :created, location: @fr_tweet }
      else
        format.html { render :new }
        format.json { render json: @fr_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fr_tweets/1
  # PATCH/PUT /fr_tweets/1.json
  def update
    respond_to do |format|
      if @fr_tweet.update(fr_tweet_params)
        format.html { redirect_to @fr_tweet, notice: 'Fr tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @fr_tweet }
      else
        format.html { render :edit }
        format.json { render json: @fr_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fr_tweets/1
  # DELETE /fr_tweets/1.json
  def destroy
    @fr_tweet.destroy
    respond_to do |format|
      format.html { redirect_to fr_tweets_url, notice: 'Fr tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fr_tweet
      @fr_tweet = FrTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fr_tweet_params
      params.require(:fr_tweet).permit(:text)
    end
end
