class AddWitnessCxScoresToAmtaBallots < ActiveRecord::Migration
  def self.up
    add_column :amta_ballots, :p_witness_1_cx, :integer
    add_column :amta_ballots, :p_witness_2_cx, :integer
    add_column :amta_ballots, :p_witness_3_cx, :integer
    add_column :amta_ballots, :d_witness_1_cx, :integer
    add_column :amta_ballots, :d_witness_2_cx, :integer
    add_column :amta_ballots, :d_witness_3_cx, :integer
  end

  def self.down
    remove_column :amta_ballots, :p_witness_1_cx
    remove_column :amta_ballots, :p_witness_2_cx
    remove_column :amta_ballots, :p_witness_3_cx
    remove_column :amta_ballots, :d_witness_1_cx
    remove_column :amta_ballots, :d_witness_2_cx
    remove_column :amta_ballots, :d_witness_3_cx
  end
end
