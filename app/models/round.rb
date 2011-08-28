class Round < ActiveRecord::Base
  belongs_to :tournament
  has_many :pairings
  has_many :ballots, :through => :pairings

  def unpaired_teams
    paired_already = []
    pairings.each do |pairing|
      pairing.affs.each do |aff|
        paired_already << aff.team
      end
      pairing.negs.each do |neg|
        paired_already << neg.team
      end
    end
    return tournament.teams - paired_already
  end

  def autopair(type, round) 
    round_index = round.index
    teams = tournament.teams

    pairing_log = "Now pairing round #{round_index} in #{tournament.title} at #{Time.now}.\n"

    pairings = Array.new
    (1..(teams.size/2)).each do #create a bunch of empty pairings (1/2 as many pairings as teams)
      pairings << Pairing.new
    end
  
    if type == "AMTA"
      # create n/2 pairings
      # assign teams to them based on the type of tournament, round index   
      # assign a room (if asked to do so)
      if round_index == 1
        teams = teams.shuffle

        pairings.each do |pairing|
          pairing.round = round
          aff = pairing.affs.build
          neg = pairing.negs.build
          aff.team = teams.pop.id
          neg.team = teams.pop.id     
          pairing.aff << aff
          pairing.neg << neg
          if aff.save and neg.save
            pairing_log << "Automatically paired #{aff.amtaid} vs. #{neg.amtaid}.\n"
          end
          if pairings.size >= tournament.rooms.size
            #assign the rooms
          end
          pairing.save
        end
      #else if round_index == 2

      #else if round_index == 3

      #else if round_index == 4
        
      end
    #else if type == "WTFQ"
      
    end
    tournament.pairing_log << pairing_log
    return true unless false #TODO: unless things failed above
  end
end
