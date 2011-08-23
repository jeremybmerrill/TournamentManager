class AmtaBallot < ActiveRecord::Base
  belongs_to :pairing

  def p_total
    
  end
  def d_total
    
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
