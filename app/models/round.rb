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
      elsif round_index == 2
        #separate into two arrays, needstobeP and needstobeD
        needsToBePlaintiff = [] #teams that were just Defense
        needsToBeDefense = []
        tournament.rounds.where("index" => round_index - 1)[0].pairings.each do |pairing|
          needsTobePlaintiff << pairing.negs[0]
          needsTobeDefense << pairing.affs[0]
        end

        #sort by record, point diff
        #needsToBePlaintiff.sort {|teamOne,teamTwo| 
        #  comp = (teamOne.pairing.d_ballots <=>  teamTwo.pairing.d_ballots)  #teamOne's round-1-pairing's won-ballots
        #  comp.zero? ? (-teamOne.pairing.point_differential <=>  -teamTwo.pairing.point_differential) : comp
        #}
        #needsToBeDefense.sort {|teamOne,teamTwo| 
        #  comp = (teamOne.pairing.p_ballots <=>  teamTwo.pairing.p_ballots)  #teamOne's round-1-pairing's won-ballots
        #  comp.zero? ? (teamOne.pairing.point_differential <=>  teamTwo.pairing.point_differential) : comp
        #}
        needsToBePlaintiff.sort {|team| [team.pairing.d_ballots, -team.pairing.point_differential]}
        needsToBeDefense.sort {|team| [team.pairing.p_ballots, team.pairing.point_differential]}
        
        #TODO: Is there a bye team? If so, move them to the bottom of their bracket.
        pairings = []
        def doPair(needsToBePlaintiff, needsToBeDefense)
          proposed_pairings = []
          (1..needsToBeDefense.length).each do |i|
            proposed_pairings << [needsToBePlaintiff[i], needsToBeDefense[i]]
          end
          return proposed_pairings
        end
        def hasImpermissibles(proposed_pairings)
          return false #TODO remove this (just for debug
          proposed_pairings.each do |pairing|
            return true if (pairing[0].school == pairing[1].school) || ()
          end
          return nil
        end
        #any same school or same-two-teams impermissibles

        while hasImpermissibles(doPair(needsToBePlaintiff, needsToBeDefense))
          #fix impermissibles
          pairings = doPair(needsToBePlaintiff, needsToBeDefense)
        end
        
        #TODO move the pairings elements to Team from Aff/Neg
        return pairings
      #elsif round_index == 3

      #elsif round_index == 4
        
      end
    #else if type == "WTFQ"
      
    end
    tournament.pairing_log << pairing_log
    return true unless false #TODO: unless things failed above
  end
end
