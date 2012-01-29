class DeleteTournamentIdColumnFromTeams < ActiveRecord::Migration
  def self.up
    remove_column :teams, :tournament_id
  end

  def self.down
    add_column :teams, :tournament_id, :integer
  end
end
