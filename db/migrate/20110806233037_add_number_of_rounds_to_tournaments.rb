class AddNumberOfRoundsToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :number_of_rounds, :integer
  end

  def self.down
    remove_column :tournaments, :number_of_rounds
  end
end
