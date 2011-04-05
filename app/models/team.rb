class Team < ActiveRecord::Base
    has_many :competitors, :dependent => :destroy
    
    validates_format_of :amtaid, :with => /[0-9]{3,4}/
    validates :school, :presence => true, :length => {:minimum => 3 }
    validates_format_of :teamabcd, :with => /[A-Za-z]/
    validates_format_of :contactemail, :with => /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
    validates_presence_of :contactphone
end
