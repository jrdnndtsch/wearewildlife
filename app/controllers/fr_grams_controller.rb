class FrGramsController < ApplicationController
  before_action :set_fr_gram, only: [:show, :edit, :update, :destroy]

  # GET /fr_grams
  # GET /fr_grams.json
  def index
    @fr_grams = FrGram.all
  end

  # GET /fr_grams/1
  # GET /fr_grams/1.json
  def show
  end

  # GET /fr_grams/new
  def new
    @fr_gram = FrGram.new
  end

  # GET /fr_grams/1/edit
  def edit
  end

  # POST /fr_grams
  # POST /fr_grams.json
  def create
    @fr_gram = FrGram.new(fr_gram_params)

    respond_to do |format|
      if @fr_gram.save
        format.html { redirect_to @fr_gram, notice: 'Fr gram was successfully created.' }
        format.json { render :show, status: :created, location: @fr_gram }
      else
        format.html { render :new }
        format.json { render json: @fr_gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fr_grams/1
  # PATCH/PUT /fr_grams/1.json
  def update
    respond_to do |format|
      if @fr_gram.update(fr_gram_params)
        format.html { redirect_to @fr_gram, notice: 'Fr gram was successfully updated.' }
        format.json { render :show, status: :ok, location: @fr_gram }
      else
        format.html { render :edit }
        format.json { render json: @fr_gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fr_grams/1
  # DELETE /fr_grams/1.json
  def destroy
    @fr_gram.destroy
    respond_to do |format|
      format.html { redirect_to fr_grams_url, notice: 'Fr gram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fr_gram
      @fr_gram = FrGram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fr_gram_params
      params.require(:fr_gram).permit(:image_url, :text)
    end
end
