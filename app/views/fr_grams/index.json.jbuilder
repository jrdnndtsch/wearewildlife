json.array!(@fr_grams) do |fr_gram|
  json.extract! fr_gram, :id, :image_url, :text
  json.url fr_gram_url(fr_gram, format: :json)
end
