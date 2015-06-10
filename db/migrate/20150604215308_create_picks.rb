class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :game_name
      t.integer :game_id
      t.string :bet
      t.integer :bet_type
      t.boolean :won
      t.float :odds
      t.integer :tipster_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
