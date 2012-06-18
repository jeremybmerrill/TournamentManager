class Pairing < ActiveRecord::Base
  belongs_to :round
  has_many :amta_ballots
  has_and_belongs_to_many :affs
  has_and_belongs_to_many :negs
  #add an association with competitors?

  #validates :aff != :neg
  
  def p_ballots
    ballots = 0
    amta_ballots.each do |b|
      if b.point_differential > 0
        ballots += 1
      elsif b.point_differential == 0
        ballots += 0.5
      end
    end
    return ballots
  end 
  def d_ballots
    ballots = 0
    amta_ballots.each do |b|
      if b.point_differential < 0
        ballots += 1
      elsif b.point_differential == 0
        ballots += 0.5
      end
    end
    return ballots
  end
  def point_differential
    running_point_diff = 0
    amta_ballots.each do |b|
        running_point_diff += b.point_differential
    end
    return running_point_diff
  end
end
