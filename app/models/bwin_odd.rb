class BwinOdd < ActiveRecord::Base
require 'httparty'
belongs_to :game

  def self.from_kimono
    results = HTTParty.get('https://www.kimonolabs.com/api/alziztne?apikey=00db7154c5e23a4d93035b9d768a79ab')
    results = results.parsed_response['results']['collection1']
    odds = results.map do |line|
      hometeam = line['localTeam']
      awayteam = line['visitorTeam']
      game_name = hometeam.upcase + " VS " + awayteam.upcase
      game = Game.where(game_name: game_name).first
      BwinOdd.create!(game: game, home_odds: line['localOdds'].to_f, away_odds: line['visitorOdds'].to_f, draw_odds: line['draw'], draw_link: line['drawLink'], home_link: line['localLink'], away_link: line['visitorLink'])
    end
  end
end
