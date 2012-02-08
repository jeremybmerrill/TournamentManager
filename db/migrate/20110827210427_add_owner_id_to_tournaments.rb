class AddOwnerIdToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :owner_id, :integer
  end

  def self.down
    remove_column :tournaments, :owner_id
  end
end
