class AddPairingsTeamsTable < ActiveRecord::Migration
  def self.up
    create_table :pairings_teams do |t|
      t.integer :pairing_id
      t.integer :team_id
      t.boolean :p
    end
  end

  def self.down
    drop_table :pairings_teams
  end
end
