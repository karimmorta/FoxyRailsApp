class Team < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_and_belongs_to_many :competitions
  has_many :compositions
  has_many :players, through: :compositions
  require 'csv'
  def self.import_from_fd_csv
    CSV.foreach('lib/L1.csv', headers:true) do |row|
      new_hash = {}
      row.to_hash.each_pair do |k,v|
        new_hash.merge!({k.downcase => v}) 
      end
      Team.where(name: new_hash.slice("hometeam")["hometeam"]).first_or_create do |team|
        team.name = new_hash.slice("hometeam")["hometeam"]
        team.division_id = Division.first.id
      end
    end
  end

  def self.from_kimono
    results = HTTParty.get('https://www.kimonolabs.com/api/31o2nrhs?apikey=00db7154c5e23a4d93035b9d768a79ab')
    results = results.parsed_response['results']['collection1']
    teams = results.map do |line|
      team = Team.create!(name: line["teamName"], logo_url: line["teamPicture"]["src"])
    end
  end
end
