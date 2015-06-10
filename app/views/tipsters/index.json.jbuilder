json.array!(@tipsters) do |tipster|
  json.extract! tipster, :id, :name, :ba_url, :avg_odds, :yield
  json.url tipster_url(tipster, format: :json)
end
