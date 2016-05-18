class Admin::HeadersController < AdminController
  before_action :set_header, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  include UpdatedBy
  # GET /headers
  # GET /headers.json
  def index
    @headers = Header.all
    add_breadcrumb "Header", 'headers'
  end

  # GET /headers/1
  # GET /headers/1.json
  def show
  end

  # GET /headers/new
  def new
    @header = Header.new
    add_breadcrumb "Header", '/admin/headers'
    add_breadcrumb "New", '#'
  end

  # GET /headers/1/edit
  def edit
    @updated_by = model_updated_by_user(@header)
    add_breadcrumb "Header", '#'
    add_breadcrumb "Edit", '#'
  end

  # POST /headers
  # POST /headers.json
  def create
    @header = Header.new(header_params)

    respond_to do |format|
      if @header.save
        format.html { redirect_to admin_headers_path, notice: 'Header was successfully created.' }
        format.json { render :show, status: :created, location: @header }
      else
        format.html { render :new }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headers/1
  # PATCH/PUT /headers/1.json
  def update
    respond_to do |format|
      if @header.update(header_params)
        format.html { redirect_to edit_admin_header_path(@header), notice: 'Header was successfully updated.' }
        format.json { render :show, status: :ok, location: @header }
      else
        format.html { render :edit }
        format.json { render json: @header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headers/1
  # DELETE /headers/1.json
  def destroy
    @header.destroy
    respond_to do |format|
      format.html { redirect_to admin_headers_path, notice: 'Header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_header
      @header = Header.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def header_params
      params.require(:header).permit(:number, :tag_line, :about)
    end
end
