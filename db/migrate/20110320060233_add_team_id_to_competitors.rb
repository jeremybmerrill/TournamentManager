class AddTeamIdToCompetitors < ActiveRecord::Migration
  def self.up
	add_column :competitors, :team_id, :integer
  end

  def self.down
	remove_column :competitors, :team_id
  end
end
