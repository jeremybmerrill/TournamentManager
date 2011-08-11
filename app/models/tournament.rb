class Tournament < ActiveRecord::Base
    #has_and_belongs_to_many :teams #this would allow teams to persist across time.
    # This is not desirable, since rosters and amtaid's change over a season.
    # Hence, new teams for each tournament, hence has_many relationship
    has_and_belongs_to_many :teams
    has_many :competitors, :through => :teams
    has_many :rounds
    has_many :ballots, :through => :rounds
    
    validates :title, :presence => true, :length => {:minimum => 3 }
    validates :date, :presence => true
    validates :location, :presence => true

    #also has info, URLs to packet pdf, map pdf, Google MyMaps?,
    #if we add ads, relationship to ads
    
end
