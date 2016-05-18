class AddTitleToFeaturedDonor < ActiveRecord::Migration
  def change
    add_column :featured_donors, :title, :string
  end
end
