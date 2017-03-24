class AddFrPhotoToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :fr_photo
    end
  end

  def self.down
    remove_attachment :stories, :fr_photo
  end
end
