class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.integer :team_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
