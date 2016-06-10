class Header < ActiveRecord::Base
	has_paper_trail

	has_attached_file :video_photo,
    styles: {
          thumbnail: '200x100^',
          header: '1440x800^'
        },
        convert_options: {
          thumbnail: " -gravity center -crop '200x100+0+0'",
          header: " -gravity center -crop '1440x800+0+0'"
        },
    default_url: "photo.jpg"
  validates_attachment_content_type :video_photo, content_type: /\Aimage\/.*\Z/
end
