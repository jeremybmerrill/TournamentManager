class AddPairingIdColumToAmtaBallots < ActiveRecord::Migration
  def self.up
    remove_column :amta_ballots, :round_id
    add_column :amta_ballots, :pairing_id, :integer 
  end

  def self.down
    remove_column :amta_ballots, :pairing_id
    add_column :amta_ballots, :round_id, :integer
  end
end
