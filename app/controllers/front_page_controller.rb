class FrontPageController < ApplicationController
	skip_before_action :authenticate_user!
  def show
  	@instagram = Instagram.user_recent_media(@deartrudence, {:count => 15})
  	# raise "hell"
  	@tweets = $client.user_timeline[0..4]
  	# raise "the roof"
  end
end
