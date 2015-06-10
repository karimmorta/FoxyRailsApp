json.array!(@games) do |game|
  json.extract! game, :id, :home_id, :away_id, :competition_id, :start_date, :end_date
  json.url game_url(game, format: :json)
end
