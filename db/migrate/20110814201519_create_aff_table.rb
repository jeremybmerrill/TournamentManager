class CreateAffTable < ActiveRecord::Migration
  def self.up
    create_table :affs do |t|
      t.integer :team_id
      t.integer :pairing_id
    end
  end

  def self.down
    drop_table :affs
  end
end
