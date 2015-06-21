class Player < ActiveRecord::Base
  has_one :team, through: :composition
end
