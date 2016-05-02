class AddAttachmentPhotoToFeaturedDonors < ActiveRecord::Migration
  def self.up
    change_table :featured_donors do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :featured_donors, :photo
  end
end
