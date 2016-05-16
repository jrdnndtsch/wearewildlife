class FrontPageController < ApplicationController
	skip_before_action :authenticate_user!
  def show
  	@instagram = Instagram.user_recent_media(@deartrudence, {:count => 15})
  	@instwogram = Instagram.user_recent_media(@deartrudence, {:count => 15}).select { |pic| pic.caption.text.include?('#Repost')}
  	@instwogram_count = Instagram.user_recent_media(@deartrudence).count { |pic| pic.caption.text.include?('#Repost')}
  	@tweets = $client.user_timeline[0..4]
  	@jb = $client.search("from:WWFCanada", :result_type => "recent").take(50)
  	@jb_count_with_hashtag = @jb.count {|tweet| tweet.text.include?('#ExploreTheSound') }
  	@jb_with_hashtag = @jb.select { |tweet| tweet.text.include?('#ExploreTheSound') }
  	# raise "the roof"
  end
end
