class CreateFbdGameStats < ActiveRecord::Migration
  def change
    create_table :fbd_game_stats
    add_column :fbd_game_stats, :game_id, :integer
    add_column :fbd_game_stats, :attendance, :integer
    add_column :fbd_game_stats, :referee_id, :integer
    add_column :fbd_game_stats, :fthg, :integer
    add_column :fbd_game_stats, :ftag, :integer
    add_column :fbd_game_stats, :ftr, :string
    add_column :fbd_game_stats, :hthg, :integer
    add_column :fbd_game_stats, :htag, :integer
    add_column :fbd_game_stats, :htr, :integer
    add_column :fbd_game_stats, :hs, :integer
    add_column :fbd_game_stats, :as, :integer
    add_column :fbd_game_stats, :hst, :integer
    add_column :fbd_game_stats, :ast, :integer
    add_column :fbd_game_stats, :hhw, :integer
    add_column :fbd_game_stats, :ahw, :integer
    add_column :fbd_game_stats, :hc, :integer
    add_column :fbd_game_stats, :ac, :integer
    add_column :fbd_game_stats, :hf, :integer
    add_column :fbd_game_stats, :af, :integer
    add_column :fbd_game_stats, :ho, :integer
    add_column :fbd_game_stats, :ao, :integer
    add_column :fbd_game_stats, :hy, :integer
    add_column :fbd_game_stats, :ay, :integer
    add_column :fbd_game_stats, :hr, :integer
    add_column :fbd_game_stats, :ar, :integer
    add_column :fbd_game_stats, :hbp, :integer
    add_column :fbd_game_stats, :abp, :integer
  end
end


