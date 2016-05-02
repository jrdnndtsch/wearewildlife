class AddAttachmentPhotoToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :stories, :photo
  end
end
