class CreateFeaturedDonors < ActiveRecord::Migration
  def change
    create_table :featured_donors do |t|
      t.string :short_description
      t.string :link

      t.timestamps null: false
    end
  end
end
