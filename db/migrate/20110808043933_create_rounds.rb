class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :tournament_id
      t.integer :plaintiff_id
      t.integer :defense_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
