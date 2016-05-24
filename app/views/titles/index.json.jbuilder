json.array!(@titles) do |title|
  json.extract! title, :id, :title, :section_name
  json.url title_url(title, format: :json)
end
