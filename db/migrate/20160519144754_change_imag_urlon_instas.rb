class ChangeImagUrlonInstas < ActiveRecord::Migration
  def change
  	rename_column :insta, :imag_url, :image_url
  end
end
