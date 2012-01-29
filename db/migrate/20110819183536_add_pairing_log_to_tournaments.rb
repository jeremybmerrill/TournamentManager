class AddPairingLogToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :pairing_log, :string
  end

  def self.down
    remove_column :tournaments, :pairing_log
  end
end
