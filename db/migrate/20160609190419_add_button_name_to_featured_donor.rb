class AddButtonNameToFeaturedDonor < ActiveRecord::Migration
  def change
    add_column :featured_donors, :button_name, :string
  end
end
