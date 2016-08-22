class FrBlogsController < ApplicationController
  before_action :set_fr_blog, only: [:show, :edit, :update, :destroy]

  # GET /fr_blogs
  # GET /fr_blogs.json
  def index
    @fr_blogs = FrBlog.all
  end

  # GET /fr_blogs/1
  # GET /fr_blogs/1.json
  def show
  end

  # GET /fr_blogs/new
  def new
    @fr_blog = FrBlog.new
  end

  # GET /fr_blogs/1/edit
  def edit
  end

  # POST /fr_blogs
  # POST /fr_blogs.json
  def create
    @fr_blog = FrBlog.new(fr_blog_params)

    respond_to do |format|
      if @fr_blog.save
        format.html { redirect_to @fr_blog, notice: 'Fr blog was successfully created.' }
        format.json { render :show, status: :created, location: @fr_blog }
      else
        format.html { render :new }
        format.json { render json: @fr_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fr_blogs/1
  # PATCH/PUT /fr_blogs/1.json
  def update
    respond_to do |format|
      if @fr_blog.update(fr_blog_params)
        format.html { redirect_to @fr_blog, notice: 'Fr blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @fr_blog }
      else
        format.html { render :edit }
        format.json { render json: @fr_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fr_blogs/1
  # DELETE /fr_blogs/1.json
  def destroy
    @fr_blog.destroy
    respond_to do |format|
      format.html { redirect_to fr_blogs_url, notice: 'Fr blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fr_blog
      @fr_blog = FrBlog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fr_blog_params
      params.require(:fr_blog).permit(:title, :author, :date, :short_description, :link, :video_link, :approved, :image_url, :wp_id, :photo_by)
    end
end
