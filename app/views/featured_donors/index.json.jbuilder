json.array!(@featured_donors) do |featured_donor|
  json.extract! featured_donor, :id, :short_description, :link
  json.url featured_donor_url(featured_donor, format: :json)
end
