class AddAvgBetToTipsters < ActiveRecord::Migration
  def change
    add_column :tipsters, :avg_bet, :float
  end
end
