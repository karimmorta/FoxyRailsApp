class Pick < ActiveRecord::Base
  require 'httparty'
  belongs_to :tipster
  belongs_to :game
  enum type: {
    win_or_loss: 0,
    draw: 1,
    win_or_loss_handicap: 2,
    over: 3,
    under: 4,
    half_time: 5,
    both_team_score: 6,
    asian_handicap: 7
  } 
  def self.from_kimono
    results = HTTParty.get('https://www.kimonolabs.com/api/7ahjycii?apikey=00db7154c5e23a4d93035b9d768a79ab')
    results = results.parsed_response['results']['collection1']
    tips = results.map do |line|
      p = Pick.new
      p.game_name = line["game"]["text"].gsub(/\n/, " ")
      if line["isWon"]["class"].blank?
        p.won = false
      else
        p.won = true
      end
      home_team_name = p.game_name.split("vs").first.strip
      away_team_name = p.game_name.split("vs").second.strip
      home_team = Team.where(name: home_team_name).first_or_create do |team|
        team.name = home_team_name
      end
      away_team = Team.where(name: away_team_name).first_or_create do |team|
        team.name = away_team_name
      end
      corresponding_game = Game.where(game_name: p.game_name).first_or_create do |game|
        game.game_name = p.game_name 
        game.home_id = home_team.id
        game.away_id = away_team.id       
      end
      puts home_team_name
      p.game_id = corresponding_game.id
      p.odds = line["odds"].to_f
      url_name = line["url"].split('/').last.gsub("-", " ")
      p.tipster = Tipster.where('name like ?',  url_name).first
      date = line["date"]
      p.date = DateTime.strptime(date, "%d/%m %H:%M")
      p.bet = line["bet"]
      p.bet_type = case 
      when (p.bet.include? "Draw")
        then 1
      when (p.bet.include? "Over")
        then 3
      when (p.bet.include? "Under")
        then 4
      when (p.bet.include? "Half Time")
        then 5
      when(p.bet.include? "Yes")
        then 6
      else 0
      end
      p.save!
    end
  end

  def odds_percent
    100 * (1 / odds) 
  end
end
