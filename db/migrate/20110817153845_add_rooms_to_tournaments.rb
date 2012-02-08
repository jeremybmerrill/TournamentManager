class AddRoomsToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :rooms, :string
  end

  def self.down
    remove_column :tournaments, :rooms
  end
end
