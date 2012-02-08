class AddAffsPairingsTable < ActiveRecord::Migration
  def self.up
    create_table :affs_pairings, :id => false do |t|
      t.integer :aff_id
      t.integer :pairing_id
    end
  end

  def self.down
    drop_table :affs_pairings
  end
end
