class BwinOdd < ActiveRecord::Base
require 'httparty'
belongs_to :game
# def self.from_kimono
#   results = HTTParty.get(https://www.kimonolabs.com/api/alziztne?apikey=00db7154c5e23a4d93035b9d768a79ab)
#   results = results.parsed_response['results']['collection1']
#   odds = results.map do |line|

# end
