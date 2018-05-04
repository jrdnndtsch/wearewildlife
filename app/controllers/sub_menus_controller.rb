class SubMenusController < ApplicationController
  before_action :set_sub_menu, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  # GET /sub_menus
  # GET /sub_menus.json
  def index
    @sub_menus = SubMenu.all
  end

  # GET /sub_menus/1
  # GET /sub_menus/1.json
  def show
  end

  # GET /sub_menus/new
  def new
    @sub_menu = SubMenu.new
  end

  # GET /sub_menus/1/edit
  def edit
  end

  # POST /sub_menus
  # POST /sub_menus.json
  def create
    @sub_menu = SubMenu.new(sub_menu_params)

    respond_to do |format|
      if @sub_menu.save
        format.html { redirect_to @sub_menu, notice: 'Sub menu was successfully created.' }
        format.json { render :show, status: :created, location: @sub_menu }
      else
        format.html { render :new }
        format.json { render json: @sub_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_menus/1
  # PATCH/PUT /sub_menus/1.json
  def update
    respond_to do |format|
      if @sub_menu.update(sub_menu_params)
        format.html { redirect_to @sub_menu, notice: 'Sub menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_menu }
      else
        format.html { render :edit }
        format.json { render json: @sub_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_menus/1
  # DELETE /sub_menus/1.json
  def destroy
    @sub_menu.destroy
    respond_to do |format|
      format.html { redirect_to sub_menus_url, notice: 'Sub menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_menu
      @sub_menu = SubMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_menu_params
      params.require(:sub_menu).permit(:title, :link, :main_menu_id, :description :order)
    end
end
