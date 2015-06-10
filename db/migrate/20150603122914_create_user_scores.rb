class CreateUserScores < ActiveRecord::Migration
  def change
    create_table :user_scores do |t|

      t.timestamps null: false
    end
  end
end
