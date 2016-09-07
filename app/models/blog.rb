class Blog < ActiveRecord::Base


	has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  include LanguagePreference
  
  has_paper_trail

  scope :are_approved, -> { where(approved: true)}

end
