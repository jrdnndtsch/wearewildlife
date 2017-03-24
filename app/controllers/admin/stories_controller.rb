class Admin::StoriesController < AdminController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  include UpdatedBy
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all.order(date: :desc)
    add_breadcrumb @stories.first.calls_to_action_lang(current_user), "/admin/stories"

    @title = Title.where("section_name = 'stories'")
    if params[:title_thing].present?
      @the_title = Title.find(params[:title_thing])
      @the_title.update(title: params[:title])
    end
    if params[:fr_title_thing].present?
      @the_title = Title.find(params[:fr_title_thing])
      @the_title.update(fr_title: params[:fr_title])
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
    add_breadcrumb @story.calls_to_action_lang(current_user), "/admin/stories"
    add_breadcrumb @story.new_lang(current_user), "#"
  end

  # GET /stories/1/edit
  def edit
    @updated_by = model_updated_by_user(@story)
    add_breadcrumb @story.calls_to_action_lang(current_user), "/admin/stories"
    add_breadcrumb @story.title_used(current_user, @story), "#"
    add_breadcrumb @story.edit_lang(current_user), "#"


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
        if params[:remove_fr_photo].present?
          @story.update(fr_photo: nil)
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
      params.require(:story).permit(:title, :fr_title, :location, :fr_location, :date, :link, :fr_link, :description, :fr_description, :featured, :photo, :fr_photo, :selected, :button_name, :fr_button_name, :photo_by, :fr_photo_by)
    end
end
