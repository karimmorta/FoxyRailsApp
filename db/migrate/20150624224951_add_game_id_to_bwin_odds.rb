class AddGameIdToBwinOdds < ActiveRecord::Migration
  def change
    add_column :bwin_odds, :game_id, :integer
  end
end
