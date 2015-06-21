class AddFanionUrlAndLogoUrlToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :fanion_url, :string
    add_column :teams, :logo_url, :string
  end
end
