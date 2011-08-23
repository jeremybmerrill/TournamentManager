class Aff < ActiveRecord::Base
  belongs_to :team
  belongs_to :pairing

  def school
    return team.school
  end
  def teamabcd
    return team.teamabcd
  end
  def team_id
    return team.id
  end
  def amtaid
    return team.amtaid
  end
  def contactemail
    return team.contactemail
  end
  def contactphone
    return team.contactphone
  end
  def competitors
    return team.competitors
  end
end
