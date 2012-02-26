class AmtaBallot < ActiveRecord::Base
  belongs_to :pairing

  #validates everything is >0, <10
  validates :p_open, :numericality => { :only_integer => true }
  validates :p_dx_1, :numericality => { :only_integer => true }
  validates :p_witness_1, :numericality => { :only_integer => true }
  validates :p_witness_1_cx, :numericality => { :only_integer => true }
  validates :d_cx_1, :numericality => { :only_integer => true }
  validates :p_dx_2, :numericality => { :only_integer => true }
  validates :p_witness_2, :numericality => { :only_integer => true }
  validates :p_witness_2_cx, :numericality => { :only_integer => true }
  validates :d_cx_2, :numericality => { :only_integer => true }
  validates :p_dx_3, :numericality => { :only_integer => true }
  validates :p_witness_3, :numericality => { :only_integer => true }
  validates :p_witness_3_cx, :numericality => { :only_integer => true }
  validates :d_cx_3, :numericality => { :only_integer => true }

  validates :d_open, :numericality => { :only_integer => true }
  validates :d_dx_1, :numericality => { :only_integer => true }
  validates :d_witness_1, :numericality => { :only_integer => true }
  validates :d_witness_1_cx, :numericality => { :only_integer => true }
  validates :p_cx_1, :numericality => { :only_integer => true }
  validates :d_dx_2, :numericality => { :only_integer => true }
  validates :d_witness_2, :numericality => { :only_integer => true }
  validates :d_witness_2_cx, :numericality => { :only_integer => true }
  validates :p_cx_2, :numericality => { :only_integer => true }
  validates :d_dx_3, :numericality => { :only_integer => true }
  validates :d_witness_3, :numericality => { :only_integer => true }
  validates :d_witness_3_cx, :numericality => { :only_integer => true }
  validates :p_cx_3, :numericality => { :only_integer => true }

  def p_total
    p_open + p_dx_1 + p_witness_1 + p_witness_1_cx + p_dx_2 + p_witness_2 + p_witness_2_cx + p_dx_3 + p_witness_3 + p_witness_3_cx + p_cx_1 + p_cx_2 + p_cx_3
  end
  def d_total
    return d_cx_1 + d_cx_2 + d_cx_3 + d_open + d_dx_1 + d_witness_1 + d_witness_1_cx + d_dx_2 + d_witness_2 + d_witness_2_cx + d_dx_3+ d_witness_3 + d_witness_3_cx
  end
  def point_differential
    return p_total - d_total
  end
  def tie?
    return p_total == d_total
  end
  def winner
    %{Return the team that won.}
  end
end
