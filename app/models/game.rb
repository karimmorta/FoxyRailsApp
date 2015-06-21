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

  def prevision
    bets = picks.map(&:bet)
    tipsters = picks.map(&:tipster)
    bets.each
    # Faire un hash depuis l'array en associant chaque bet avec le score du pronostiqueur
    # Donner un poids au paris Asian / Non Asian / Over Under avec les status du championnat l'historique de la confrontation 
  end
end
