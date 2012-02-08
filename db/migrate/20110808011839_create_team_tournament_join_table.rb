class CreateTeamTournamentJoinTable < ActiveRecord::Migration
  def self.up
    create_table :teams_tournaments, :id => false do |t|
      t.integer :team_id
      t.integer :tournament_id
    end
  end

  def self.down
    drop_table :teams_tournaments
  end
end
