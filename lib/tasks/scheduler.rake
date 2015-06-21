task :create_games_fd => :environment do
  puts "Creating games..."
  Game.import_from_fd_csv
  puts "done."
end

desc "Import Teams"
task :create_teams_fd => :environment do
  puts "Create team"
  Team.import_from_fd_csv
  puts "done."
end

desc "Import Tipster top 15 for BA"
task :create_tipsters => :environment do
  puts "Creating Tipsters"
  Tipster.from_kimono
  puts "done."
end

desc "Import Picks for the TOP 15 pisters for BA"
task :create_picks => :environment do
  puts "Creating Picks"
  Pick.from_kimono
  puts "done."
end

desc "Create Copa america teams"
task :create_copa_america => :environment do
  puts "Creating teams"
  Team.from_kimono
  puts "done."
end

desc "Simulate some picks"
task :tipsters_picks => :environment do

  # Create Teams
  brasil = Team.where(name: "Brasil").first_or_create(name: "Brasil")
  chili = Team.where(name: "Chili").first_or_create(name: "Chili")

  # Create Model Competition before this
  # Competition.create(name: "Copa America")
  game = Game.where(home_id: brasil.id, away_id: chili.id, game_name: "BRASIL VS CHILI").first_or_create(home_id: brasil.id, away_id: chili.id, game_name: "BRASIL VS CHILI")

  Tipster.first.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away", odds: 1.60)
  Tipster.second.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away", odds: 1.60)
  Tipster.third.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "home", odds: 2.60)
  Tipster.fourth.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away", odds: 1.60)
  Tipster.fifth.picks.create(game_id: game.id, game_name: game.game_name, bet_type: 3, bet: "2.5")
  Tipster.find(6).picks.create(game_id: game.id, game_name: game.game_name, bet_type: 3, bet: "2.5")
  Tipster.find(7).picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "home", odds: 2.60)
  Tipster.find(8).picks.create(game_id: game.id, game_name: game.game_name, bet_type: 7, bet: "away -0.75")
  Tipster.find(9).picks.create(game_id: game.id, game_name: game.game_name, bet_type: 7, bet: "away -0.75")
  Tipster.find(10).picks.create(game_id: game.id, game_name: game.game_name, bet_type: 0, bet: "away")
end