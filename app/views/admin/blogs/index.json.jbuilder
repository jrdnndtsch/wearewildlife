json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :author, :date, :short_description, :link, :video_link
  json.url blog_url(blog, format: :json)
end
