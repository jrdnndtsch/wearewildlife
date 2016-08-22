json.array!(@fr_blogs) do |fr_blog|
  json.extract! fr_blog, :id, :title, :author, :date, :short_description, :link, :video_link, :approved, :image_url, :wp_id, :photo_by
  json.url fr_blog_url(fr_blog, format: :json)
end
