class Admin::MainMenusController < AdminController
  before_action :set_main_menu, only: [:show, :edit, :update, :destroy]
  before_filter :set_paper_trail_whodunnit
  # GET /main_menus
  # GET /main_menus.json
  def index
    @main_menus = MainMenu.all
    add_breadcrumb "main menu", 'main_menus'
  end

  # GET /main_menus/1
  # GET /main_menus/1.json
  def show
  end

  # GET /main_menus/new
  def new
    @main_menu = MainMenu.new
    add_breadcrumb "main menu", '/admin/main_menus'
    add_breadcrumb "new", '#'
  end

  # GET /main_menus/1/edit
  def edit
    add_breadcrumb "main menu", '/admin/main_menus'
    add_breadcrumb @main_menu.title, '#'
    add_breadcrumb "new", '#'
  end

  # POST /main_menus
  # POST /main_menus.json
  def create
    @main_menu = MainMenu.new(main_menu_params)

    respond_to do |format|
      if @main_menu.save
        format.html { redirect_to edit_admin_main_menu_path(@main_menu), notice: 'Main menu was successfully created.' }
        format.json { render :show, status: :created, location: @main_menu }
      else
        format.html { render :new }
        format.json { render json: @main_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_menus/1
  # PATCH/PUT /main_menus/1.json
  def update
    respond_to do |format|
      if @main_menu.update(main_menu_params)
        format.html { redirect_to edit_admin_main_menu_path(@main_menu), notice: 'Main menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_menu }
      else
        format.html { render :edit }
        format.json { render json: @main_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_menus/1
  # DELETE /main_menus/1.json
  def destroy
    @main_menu.destroy
    respond_to do |format|
      format.html { redirect_to admin_main_menus_path, notice: 'Main menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_menu
      @main_menu = MainMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_menu_params
      params.require(:main_menu).permit(:title, :fr_title, :link, :fr_link, sub_menus_attributes:[:id, :title, :fr_title, :link, :fr_link, :description, :fr_description, :main_menu_id, :_destroy])
    end
end
