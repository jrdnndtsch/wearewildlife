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
  has_paper_trail  
end
