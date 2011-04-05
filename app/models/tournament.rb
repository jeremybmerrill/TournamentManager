class Tournament < ActiveRecord::Base
    #has_and_belongs_to_many :teams
    has_many :competitors, :through => :teams
    validates :title, :presence => true, :length => {:minimum => 3 }
    validates :date, :presence => true
    validates :location, :presence => true
end
