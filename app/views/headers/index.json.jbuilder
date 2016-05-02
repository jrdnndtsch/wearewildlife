json.array!(@headers) do |header|
  json.extract! header, :id, :number, :tag_line, :about
  json.url header_url(header, format: :json)
end
