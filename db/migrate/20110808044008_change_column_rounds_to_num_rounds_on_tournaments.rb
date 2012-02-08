class ChangeColumnRoundsToNumRoundsOnTournaments < ActiveRecord::Migration
  def self.up
    remove_column :tournaments, :rounds
    change_table :tournaments do |t|
      t.integer :num_rounds
    end
  end

  def self.down
    remove_column :tournaments, :num_rounds
    add_column :tournaments, :rounds, :integer
  end
end
