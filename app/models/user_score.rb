class UserScore < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_score
end
