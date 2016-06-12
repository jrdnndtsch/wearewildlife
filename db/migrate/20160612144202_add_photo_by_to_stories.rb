class AddPhotoByToStories < ActiveRecord::Migration
  def change
    add_column :stories, :photo_by, :string
  end
end
