class AddTypeOfTeamToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :type_of_team, :string
  end

  def self.down
    remove_column :teams, :type_of_team
  end
end
