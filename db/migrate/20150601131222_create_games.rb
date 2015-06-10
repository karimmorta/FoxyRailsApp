class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_id
      t.integer :away_id
      t.string :game_name
      t.integer :competition_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
