class Admin::InstasController < ApplicationController

	def upload	
		@instas = Instagram.user_recent_media(@deartrudence, {:count => 15})
		@instas_with_hashtag = @instas.select { |pic| pic.caption.text.include?('#Repost') }
		@instas_with_hashtag.last(5).each_with_index do |insta, index|
			index_plus_one = index + 1
			this_insta = Insta.where(id: index_plus_one).first_or_initialize({text: insta.caption.text, imag_url: insta.images.standard_resolution.url})
			this_insta.save
		end 
		render nothing: true, status: :ok, content_type: "text/html"
	end
end