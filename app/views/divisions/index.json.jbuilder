json.array!(@divisions) do |division|
  json.extract! division, :id, :name, :short_name, :country
  json.url division_url(division, format: :json)
end
