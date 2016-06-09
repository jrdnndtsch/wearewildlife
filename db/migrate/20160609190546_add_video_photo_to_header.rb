class AddVideoPhotoToHeader < ActiveRecord::Migration
  def self.up
    change_table :headers do |t|
      t.attachment :video_photo
    end
  end

  def self.down
    remove_attachment :headers, :video_photo
  end

end
