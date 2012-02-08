class SwitchDateFormatOnTournaments < ActiveRecord::Migration
  def self.up
    remove_column :tournaments, :date
    add_column :tournaments, :start_date, :datetime 
    add_column :tournaments, :end_date, :datetime
  end

  def self.down
    remove_column :tournaments, :end_date
    remove_column :tournaments, :start_date
    add_column :tournaments, :date, :string 
 end
end
