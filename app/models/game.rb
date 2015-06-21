class Game < ActiveRecord::Base
  has_many :picks
  require 'csv'

  def self.search(search)
    if search
      where('game_name LIKE ?', "%#{search}%")
    else
      all
    end
  end
  def self.import_from_fd_csv
    CSV.foreach('lib/L1.csv', headers:true) do |row|
      new_hash = {}
      row.to_hash.each_pair do |k,v|
       new_hash.merge!({k.downcase => v}) 
      end
      game = Game.new new_hash.except("hometeam", "awayteam", "date", "div", "bbmx>2.5", "bbav>2.5", "bbmx<2.5", "bbav<2.5", "bbah", "bbahh", "bbmxahh", "bbavahh", "bbmxaha", "bbavaha", "gbahh", "gbaha", "gbah", "lbahh", "lbaha", "lbah", "b365ahh", "b365aha", "b365ah")
      game.home_id = Team.where(name: new_hash.slice("hometeam")["hometeam"]).first.id
      game.away_id = Team.where(name: new_hash.slice("awayteam")["awayteam"]).first.id
      game.start_date =  Date.strptime(new_hash.slice("date")["date"], '%d/%m/%Y') + 2000.years
      game.competition_id = Division.first.id
      game.save!
    end
  end

  def winner
    case ftr
      when "A"
        winner = Team.find(self.away_id)
      when "H"  
        winner = Team.find(self.home_id)
      when "D"
        winner = nil
    end
  end

  def looser
    case ftr
      when "A"
        winner = Team.find(self.home_id)
      when "H"  
        winner = Team.find(self.away_id)
      when "D"
        winner = nil
    end
  end

  def hometeam
    Team.find(home_id)
  end

  def awayteam
    Team.find(away_id)
  end

  def outcome
    # bets = picks.map(&:bet)
    # tipsters = picks.map(&:tipster)
    win_or_loss = []
    over = []
    both_team_score = []
    picks.each do |bet|
      case bet.bet_type
      when "win_or_loss"
        then win_or_loss << bet
      when "over"
        then over << bet
      when "both_team_score"
        then both_team_score << bet
      end
    end
    
    wor_outcomes = win_or_loss.map! { |e| {e.bet => e.tipster.score.to_s, "calculations" => e.calculations } }
    keys = []
    values = []
    outcomes_home = 0
    outcomes_away = 0
    wor_outcomes.each do |key, value|
      # Vérifier si le montant et la côte du pronostic se rapprochent du montant et de la côte moyens du pronostiqueur 
      delta_odds = key.values.second.values.first
      delta_amount = key.values.second.values.second
      p delta_odds
      p delta_amount
      if key.first.first == hometeam.name.upcase
        outcomes_home += key.first.second.to_f - (delta_odds * 0.75) - (delta_amount * 0.05) # - e.tipster.amount # - e.tipster.avg_odds
      end
      if key.first.first == awayteam.name.upcase
        outcomes_away += key.first.second.to_f - (delta_odds * 0.75) - (delta_amount * 0.05)
      end
    end
    if outcomes_home > outcomes_away
      outcome = outcomes_home / (outcomes_home + outcomes_away) - 0.1
      return hometeam, outcome
    else
      outcome = outcomes_away / (outcomes_home + outcomes_away) - 0.1
      return awayteam, outcome
    end
    # Faire un hash depuis l'array en associant chaque bet avec le score du pronostiqueur
    # Donner un poids au paris Asian / Non Asian / Over Under avec les status du championnat l'historique de la confrontation
  end 
end
