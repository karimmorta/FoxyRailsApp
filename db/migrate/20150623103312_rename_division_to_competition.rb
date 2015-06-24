class RenameDivisionToCompetition < ActiveRecord::Migration
  def change
    rename_table :divisions, :competitions
  end
end
