class ChangeDateTypeOnTournaments < ActiveRecord::Migration
  def self.up
    change_column :tournaments, :start_date, :date
    change_column :tournaments, :end_date, :date
  end

  def self.down
    change_column :tournaments, :end_date, :datetime
    change_column :tournaments, :start_date, :datetime 
  end
end
