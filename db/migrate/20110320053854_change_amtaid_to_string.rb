class ChangeAmtaidToString < ActiveRecord::Migration
  def self.up
	change_column :teams, :amtaid, :string
  end

  def self.down
	change_column :teams, :amtaid, :integer
  end
end
