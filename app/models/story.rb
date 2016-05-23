class Story < ActiveRecord::Base
	has_attached_file :photo,
    styles: {
          thumbnail: '100x100^',
          header: '500x500^'
        },
        convert_options: {
          thumbnail: " -gravity center -crop '100x100+0+0'",
          header: " -gravity center -crop '500x500+0+0'"
        },
    default_url: "photo.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  # validates :featured, :uniqueness => true
  
  has_paper_trail  

  scope :are_selected, -> { where(selected: true) }
  scope :is_featured, -> { where(featured: true) }
  scope :are_not_featured, -> { where(featured: false) }
end
