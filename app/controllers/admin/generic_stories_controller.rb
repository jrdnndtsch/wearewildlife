class Admin::GenericStoriesController < AdminController
  before_action :set_generic_story, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  include UpdatedBy
  # GET /generic_stories
  # GET /generic_stories.json
  def index
    @generic_stories = GenericStory.all
    add_breadcrumb "Generic Stories", 'generic_stories'
  end

  # GET /generic_stories/1
  # GET /generic_stories/1.json
  def show
  end

  # GET /generic_stories/new
  def new
    @generic_story = GenericStory.new
    add_breadcrumb "Generic Stories", '/admin/generic_stories'
    add_breadcrumb "New", '#'
  end

  # GET /generic_stories/1/edit
  def edit
    @updated_by = model_updated_by_user(@generic_story)
    add_breadcrumb "Generic Stories", '/admin/generic_stories'
    add_breadcrumb "Edit", '#'
  end

  # POST /generic_stories
  # POST /generic_stories.json
  def create
    @generic_story = GenericStory.new(generic_story_params)

    respond_to do |format|
      if @generic_story.save
        format.html { redirect_to admin_generic_stories_path, notice: 'Generic story was successfully created.' }
        format.json { render :show, status: :created, location: @generic_story }
      else
        format.html { render :new }
        format.json { render json: @generic_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generic_stories/1
  # PATCH/PUT /generic_stories/1.json
  def update
    respond_to do |format|
      if @generic_story.update(generic_story_params)
        format.html { redirect_to admin_generic_stories_path, notice: 'Generic story was successfully updated.' }
        format.json { render :show, status: :ok, location: @generic_story }
      else
        format.html { render :edit }
        format.json { render json: @generic_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generic_stories/1
  # DELETE /generic_stories/1.json
  def destroy
    @generic_story.destroy
    respond_to do |format|
      format.html { redirect_to admin_generic_stories_path, notice: 'Generic story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic_story
      @generic_story = GenericStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generic_story_params
      params.require(:generic_story).permit(:title, :short_description, :link, :selected)
    end
end
