class ChangeDivisionIdToCompetitionIdForGames < ActiveRecord::Migration
  def change
    rename_column :teams, :division_id, :competition_id
  end
end
