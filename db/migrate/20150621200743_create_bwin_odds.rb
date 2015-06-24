class CreateBwinOdds < ActiveRecord::Migration
  def change
    create_table :bwin_odds do |t|
      t.float :home_odds
      t.float :draw_odds
      t.float :away_odds
      t.string :home_link
      t.string :draw_link
      t.string :away_link
      t.string :home_team
      t.string :away_team

      t.timestamps null: false
    end
  end
end
