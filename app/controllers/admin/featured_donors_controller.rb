class Admin::FeaturedDonorsController < AdminController
  before_action :set_featured_donor, only: [:show, :edit, :update, :destroy]
   before_filter :set_paper_trail_whodunnit

   include UpdatedBy

  # GET /featured_donors
  # GET /featured_donors.json
  def index
    @featured_donors = FeaturedDonor.all
    add_breadcrumb @featured_donors.first.featured_member_lang(current_user), 'featured_donors'
  end

  # GET /featured_donors/1
  # GET /featured_donors/1.json
  def show
  end

  # GET /featured_donors/new
  def new
    @featured_donor = FeaturedDonor.new
    add_breadcrumb @featured_donor.featured_member_lang(current_user), '/admin/featured_donors'
    add_breadcrumb @featured_donor.new_lang(current_user), '#'
  end

  # GET /featured_donors/1/edit
  def edit
    @updated_by = model_updated_by_user(@featured_donor)
    add_breadcrumb @featured_donor.featured_member_lang(current_user), '/admin/featured_donors'
    add_breadcrumb @featured_donor.title_used(current_user, @featured_donor), '#'
    add_breadcrumb @featured_donor.edit_lang(current_user), '#'
  end

  # POST /featured_donors
  # POST /featured_donors.json
  def create
    @featured_donor = FeaturedDonor.new(featured_donor_params)

    respond_to do |format|
      if @featured_donor.save
        format.html { redirect_to edit_admin_featured_donor_path(@featured_donor), notice: 'Featured donor was successfully created.' }
        format.json { render :show, status: :created, location: @featured_donor }
      else
        format.html { render :new }
        format.json { render json: @featured_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /featured_donors/1
  # PATCH/PUT /featured_donors/1.json
  def update
    respond_to do |format|
      if @featured_donor.update(featured_donor_params)
        if params[:remove_photo].present?
          @featured_donor.update(photo: nil)
        end
        format.html { redirect_to edit_admin_featured_donor_path(@featured_donor), notice: 'Featured donor was successfully updated.' }
        format.json { render :show, status: :ok, location: @featured_donor }
      else
        format.html { render :edit }
        format.json { render json: @featured_donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featured_donors/1
  # DELETE /featured_donors/1.json
  def destroy
    @featured_donor.destroy
    respond_to do |format|
      format.html { redirect_to admin_featured_donors_path, notice: 'Featured donor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featured_donor
      @featured_donor = FeaturedDonor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featured_donor_params
      params.require(:featured_donor).permit(:short_description,:fr_short_description, :link, :fr_link, :photo, :title, :fr_title, :featured, :button_name, :fr_button_name, :photo_by, :fr_photo_by)
    end
end
