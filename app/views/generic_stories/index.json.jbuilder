json.array!(@generic_stories) do |generic_story|
  json.extract! generic_story, :id, :title, :short_description, :link
  json.url generic_story_url(generic_story, format: :json)
end
