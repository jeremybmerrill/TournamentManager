class CreatePros < ActiveRecord::Migration
  def self.up
    create_table :pros do |t|
      t.integer :team_id
      t.integer :pairing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pros
  end
end
