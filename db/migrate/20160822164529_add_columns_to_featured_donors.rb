class AddColumnsToFeaturedDonors < ActiveRecord::Migration
  def change
  	add_column :featured_donors, :fr_short_description, :string
  	add_column :featured_donors, :fr_link, :string
  	add_column :featured_donors, :fr_title, :string
  	add_column :featured_donors, :fr_button_name, :string
  	add_column :featured_donors, :fr_photo_by, :string
  end
end
