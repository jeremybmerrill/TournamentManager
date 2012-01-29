class AddTournamentIdToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :tournament_id, :integer
  end

  def self.down
    remove_column :teams, :tournament_id
  end
end
