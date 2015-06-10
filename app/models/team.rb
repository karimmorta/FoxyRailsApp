class Team < ActiveRecord::Base
  belongs_to :games
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
end
