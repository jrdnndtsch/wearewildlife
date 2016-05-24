class Admin::StoriesController < AdminController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  include UpdatedBy
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
    add_breadcrumb "stories", "/admin/stories"

    @title = Title.where("section_name = 'stories'")
    if params[:title_thing].present?
      @the_title = Title.find(params[:title_thing])
      @the_title.update(title: params[:title])
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
    add_breadcrumb "stories", "/admin/stories"
    add_breadcrumb "new", "#"
  end

  # GET /stories/1/edit
  def edit
    @updated_by = model_updated_by_user(@story)
    add_breadcrumb "stories", "/admin/stories"
    add_breadcrumb @story.title, "#"
    add_breadcrumb "edit", "#"


  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to admin_story_path(@story), notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        if params[:remove_photo].present?
          @story.update(photo: nil)
        end
        format.html { redirect_to edit_admin_story_path(@story), notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to admin_stories_path, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :location, :date, :link, :description, :featured, :photo, :selected)
    end
end
