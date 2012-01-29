class CreateAmtaBallots < ActiveRecord::Migration
  def self.up
    create_table :amta_ballots do |t|
      t.integer :round_id
      t.integer :p_open
      t.integer :d_open
      t.integer :p_witness_1
      t.integer :p_dx_1
      t.integer :d_cx_1
      t.integer :p_witness_2
      t.integer :p_dx_2
      t.integer :d_cx_2
      t.integer :p_witness_3
      t.integer :p_dx_3
      t.integer :d_cx_3
      t.integer :d_witness_1
      t.integer :d_dx_1
      t.integer :p_cx_1
      t.integer :d_witness_2
      t.integer :d_dx_2
      t.integer :p_cx_2
      t.integer :d_witness_3
      t.integer :d_dx_3
      t.integer :p_cx_3
      t.integer :p_close
      t.integer :d_close
      t.integer :atty_rank_1
      t.integer :atty_rank_2
      t.integer :atty_rank_3
      t.integer :atty_rank_4
      t.integer :witness_rank_1
      t.integer :witness_rank_2
      t.integer :witness_rank_3
      t.integer :witness_rank_4

      t.timestamps
    end
  end

  def self.down
    drop_table :amta_ballots
  end
end
