class FixPairingsTeamsTable < ActiveRecord::Migration
  def self.up
    drop_table :pairings_teams
    create_table :pairings_teams, :id => false do |t|
      t.integer :pairing_id
      t.integer :team_id
    end
  end

  def self.down
    drop_table :pairings_teams
  end
end
