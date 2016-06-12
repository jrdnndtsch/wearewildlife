class AddPhotoByToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :photo_by, :string
  end
end
