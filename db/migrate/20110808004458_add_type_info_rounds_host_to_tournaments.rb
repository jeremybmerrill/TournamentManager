class AddTypeInfoRoundsHostToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :info, :text
    add_column :tournaments, :rounds, :integer
    add_column :tournaments, :host, :text
  end

  def self.down
    remove_column :tournaments, :host
    remove_column :tournaments, :rounds
    remove_column :tournaments, :info
  end
end
