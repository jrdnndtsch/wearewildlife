class AddFeaturedToFeaturedDonor < ActiveRecord::Migration
  def change
    add_column :featured_donors, :featured, :boolean, default: false
  end
end
