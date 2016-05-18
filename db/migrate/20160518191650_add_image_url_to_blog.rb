class AddImageUrlToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :image_url, :string
  end
end
