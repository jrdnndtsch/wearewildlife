json.array!(@stories) do |story|
  json.extract! story, :id, :title, :location, :date, :link, :description, :featured
  json.url story_url(story, format: :json)
end
