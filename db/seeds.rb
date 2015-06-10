# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Division.create(name: "Ligue 1", short_name: "L1", country: "France")



# Create Teams

brasil = Team.create(name: "Brasil")
chili = Team.create(name: "Chili")

# Create Model Competition before this
# Competition.create(name: "Copa America")

game = Game.create(home_id: brasil.id, away_id: chili.id, game_name: "BRASIL VS CHILI")

Tipster.first.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away")
Tipster.second.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away")
Tipster.third.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "home")
Tipster.fourth.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away")
Tipster.fifth.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 3, bet: "2.5")



# Tipster.find_each do |tipster|
#   tipster.picks.create(game_id: game.id,)