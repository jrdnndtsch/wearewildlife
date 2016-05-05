class FrontPageController < ApplicationController
	skip_before_action :authenticate_user!
  def show
  	@instagram = Instagram.user_recent_media(@deartrudence)
  	# raise "hell"
  end
end
