class Tipster < ActiveRecord::Base
  require 'httparty'
  has_many :picks

  # after_save :calculate_avg_bet, :set_score, :win_rate_ten, :win_rate

  def self.from_kimono
    results = HTTParty.get('https://www.kimonolabs.com/api/54och008?apikey=00db7154c5e23a4d93035b9d768a79ab')
    results = results.parsed_response['results']['collection1']
    tipsters = results.map do |line|
      t = Tipster.new
      t.name = line['tipsterName']['text']
      t.ba_url = line['tipsterName']['href']
      t.avg_odds = line['avgOdds'].to_f
      t.avg_yield = line['tipsterYield'].to_f
      t.save!
    end
  end

  def self.best_scorer
    score = includes(:picks).all.map(&:score).max
    Tipster.where(score: score).first
  end

  def win_rate_ten
    picks_results = self.picks.last(10).map(&:won)
    won_picks = picks_results.select {|y| y == true}
    won_picks.count / picks_results.length.to_f
  end

  def win_rate
    picks_results = self.picks.map(&:won)
    won_picks = picks_results.select {|y| y == true}
    won_picks.count / picks_results.length.to_f
  end

  def calculate_avg_bet
    picks_amounts = self.picks.where('amount > ?', 0).map(&:amount)
    self.avg_bet = picks_amounts.inject(:+) / picks_amounts.count
    save!
  end

  def set_score
    self.score = (self.win_rate * 0.5) + self.win_rate_ten + (picks.count / 10) - (avg_odds * 0.15) + (avg_bet * 0.2)
    self.save! 
  end
end