class AddNegsPairingsTable < ActiveRecord::Migration
  def self.up
    create_table :negs_pairings, :id => false do |t|
      t.integer :neg_id
      t.integer :pairing_id
    end
  end

  def self.down
    drop_table :negs_pairings
  end
end
