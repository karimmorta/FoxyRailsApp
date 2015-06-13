class AddAmountToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :amount, :float
  end
end
