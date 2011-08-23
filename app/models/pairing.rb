class Pairing < ActiveRecord::Base
  belongs_to :round
  has_many :amta_ballots
  has_and_belongs_to_many :affs
  has_and_belongs_to_many :negs
  #add an association with competitors?

  #validates :aff != :neg

end
