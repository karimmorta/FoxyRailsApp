class CreateTipsters < ActiveRecord::Migration
  def change
    create_table :tipsters do |t|
      t.string :name
      t.string :ba_url
      t.float :avg_odds
      t.float :avg_yield
      t.float :score

      t.timestamps null: false
    end
  end
end
