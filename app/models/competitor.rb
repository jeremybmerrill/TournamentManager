class Competitor < ActiveRecord::Base
    belongs_to :team
    validates :name, :presence => true, :length => {:minimum => 3 }

    belongs_to :user
    #validates_format_of :contactemail, :with => /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
    #validates_presence_of :contactphone
end
