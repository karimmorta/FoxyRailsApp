class CreateBettingOdds < ActiveRecord::Migration
  def change
    create_table :betting_odds do |t|
      t.timestamps null: false
    end
    add_column :betting_odds, :b365h, :float
    add_column :betting_odds, :b365d, :float
    add_column :betting_odds, :b365a, :float
    add_column :betting_odds, :bsh, :float
    add_column :betting_odds, :bsd, :float
    add_column :betting_odds, :bsa, :float
    add_column :betting_odds, :bwh, :float
    add_column :betting_odds, :bwd, :float
    add_column :betting_odds, :bwa, :float
    add_column :betting_odds, :gb, :float
    add_column :betting_odds, :gbd, :float
    add_column :betting_odds, :gba, :float
    add_column :betting_odds, :iwh, :float
    add_column :betting_odds, :iwd, :float
    add_column :betting_odds, :iwa, :float
    add_column :betting_odds, :lbh, :float
    add_column :betting_odds, :lbd, :float
    add_column :betting_odds, :lba, :float
    add_column :betting_odds, :psh, :float
    add_column :betting_odds, :psd, :float
    add_column :betting_odds, :psa, :float
    add_column :betting_odds, :soh, :float
    add_column :betting_odds, :sod, :float
    add_column :betting_odds, :soa, :float
    add_column :betting_odds, :sbh, :float
    add_column :betting_odds, :sbd, :float
    add_column :betting_odds, :sba, :float
    add_column :betting_odds, :sjh, :float
    add_column :betting_odds, :sjd, :float
    add_column :betting_odds, :sja, :float
    add_column :betting_odds, :syh, :float
    add_column :betting_odds, :syd, :float
    add_column :betting_odds, :sya, :float
    add_column :betting_odds, :vch, :float
    add_column :betting_odds, :vcd, :float
    add_column :betting_odds, :vca, :float
    add_column :betting_odds, :whh, :float
    add_column :betting_odds, :whd, :float
    add_column :betting_odds, :wha, :float
    add_column :betting_odds, :bb1x2, :integer
    add_column :betting_odds, :bbmxh, :float
    add_column :betting_odds, :bbavh, :float
    add_column :betting_odds, :bbmxd, :float
    add_column :betting_odds, :bbavd, :float
    add_column :betting_odds, :bbmxa, :float
    add_column :betting_odds, :bbava, :float
    add_column :betting_odds, :bbou, :integer
    add_column :betting_odds, :bbmx_over_two_point_five, :float
    add_column :betting_odds, :bbav_over_two_point_five, :float
    add_column :betting_odds, :bbmx_under_two_point_five, :float
    add_column :betting_odds, :bbav_under_two_point_five, :float
  end
end
