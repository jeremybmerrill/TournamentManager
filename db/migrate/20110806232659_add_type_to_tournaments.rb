class AddTypeToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :type, :string
  end

  def self.down
    remove_column :tournaments, :type
  end
end
