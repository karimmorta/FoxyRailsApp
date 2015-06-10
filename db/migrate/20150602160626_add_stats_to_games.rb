class AddStatsToGames < ActiveRecord::Migration
  def change
    add_column :games, :attendance, :integer
    add_column :games, :referee_id, :integer
    add_column :games, :fthg, :integer
    add_column :games, :ftag, :integer
    add_column :games, :ftr, :string
    add_column :games, :hthg, :integer
    add_column :games, :htag, :integer
    add_column :games, :htr, :integer
    add_column :games, :hs, :integer
    add_column :games, :as, :integer
    add_column :games, :hst, :integer
    add_column :games, :ast, :integer
    add_column :games, :hhw, :integer
    add_column :games, :ahw, :integer
    add_column :games, :hc, :integer
    add_column :games, :ac, :integer
    add_column :games, :hf, :integer
    add_column :games, :af, :integer
    add_column :games, :ho, :integer
    add_column :games, :ao, :integer
    add_column :games, :hy, :integer
    add_column :games, :ay, :integer
    add_column :games, :hr, :integer
    add_column :games, :ar, :integer
    add_column :games, :hbp, :integer
    add_column :games, :abp, :integer
  end
end
