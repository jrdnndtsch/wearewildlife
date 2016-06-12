class AddPhotoByToFeaturedDonors < ActiveRecord::Migration
  def change
    add_column :featured_donors, :photo_by, :string
  end
end
