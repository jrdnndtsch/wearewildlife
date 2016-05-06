class FrontPageController < ApplicationController
	skip_before_action :authenticate_user!
  def show
  	@instagram = Instagram.user_recent_media(@deartrudence, {:count => 15})
  	# raise "hell"
  end
end
