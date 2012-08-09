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


############################
#
#  AUTOPAIR and helper methods
#
############################
  def doPair(needsToBePlaintiff, needsToBeDefense)
    proposed_pairings = []
    (1...needsToBeDefense.length).each do |i|
      proposed_pairings << [needsToBePlaintiff[i], needsToBeDefense[i]]
    end
    return proposed_pairings
  end

  def hasImpermissibles(proposed_pairings)
    proposed_pairings.each_with_index do |pairing, pairing_index|
      if pairing == [nil, nil]
        next
      end
      @pairing_log << "Impermissible found!"
      return pairing_index if (pairing[0].school == pairing[1].school) || ()
      #                     same school impermissible                                                                       already faced each other impermissible
      #TODO write already-faced-each-other impermissible
    end
    @pairing_log << "No impermissibles found!"
    return false
  end

  comparison_methods = []
  def findSwitchCandidate(comparison_method, candidates, needsToBeDefense, needsToBePlaintiff) #only valid for round 2
    closest_value = 10000 # a really big number (no team's Record, CS or Point_Differential will ever differ by more than 10000)
    to_be_switched = []
    [candidates].each do |candidate_to_be_switched|
      if candidate_to_be_switched.class == Aff
        needsToBeArray = needsToBeDefense
      else
        needsToBeArray = needsToBePlaintiff
      end
      closest_value_candidate = (comparison_method(candidate_to_be_switched) - comparison_method(needsToBeArray[impermissible_index])).abs
      if closest_value_candidate < closest_value
        closest_value = closest_value_candidate
        to_be_switched = [candidate_to_be_switched]
      elsif closest_value_candidate == closest_value
        #go to next comparison method
        to_be_switched << candidate_to_be_switched
      end
    end
    if to_be_switched.size == 1
      return to_be_switched[0] #the team to be switched
    elsif to_be_switched.size > 1
      next_method = comparison[comparison_methods.index(comparison_method) +1]
      if next_method.nil?
        #we're all out of comparison methods: prefer defense, prefer lower ranked candidates
        #is there only one candidate-to-be-switched team who is from the needsToBeDefense
        candidate_defense_teams = to_be_switched.find_all{ |candidate| needsToBeDefense.include? candidate } #.size maximum is 2
        if candidate_defense_teams.size == 0
          if needsToBePlaintiff.index(candidate_defense_teams[0]) > needsToBePlaintiff.index(candidate_defense_teams[1])
            return candidate_defense_teams[0]
          else
            return candidate_defense_teams[1]
          end
        elsif candidate_defense_teams.size == 1
          return candidate_defense_teams[0]
        else # candidate_defense_teams.size == 2
          #return D team with numerically higher index. (e.g. return 6 if choosing from 6 and 4)
          if needsToBeDefense.index(candidate_defense_teams[0]) > needsToBeDefense.index(candidate_defense_teams[1])
            return candidate_defense_teams[0]
          else
            return candidate_defense_teams[1]
          end
        end
      else
        return findSwitchCandidate(next_method, to_be_switched, needsToBeDefense, needsToBePlaintiff)
      end
    else to_be_switched.size < 1
      #barf! Should be unreachable.
    end
  end



  def autopair(type, round) 
    round_index = round.index
    teams = tournament.teams
    pairerslist = [] #an array of two-element sets that have been swapped this round

    @pairing_log = ["Now pairing round #{round_index} in #{tournament.title} at #{Time.now}."]
    if round.pairings.size > 0 #No autopairing if pairs already existin this round.
      return false
    end
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

        pairings.each do |pairing| #TODO: Redo this to use a common scheme to translate pairings array into actual pairings
          pairing.round = round
          aff = pairing.affs.build
          neg = pairing.negs.build
          aff.team = teams.pop
          neg.team = teams.pop     
          pairing.affs << aff
          pairing.negs << neg
          if aff.save and neg.save
            @pairing_log << "Automatically paired #{aff.amtaid} vs. #{neg.amtaid}."
          end
          if tournament.rooms && pairings.size <= tournament.rooms.size
            #assign the rooms
          end
          pairing.round.tournament.pairing_log += @pairing_log
          pairing.save
        end

      elsif round_index == 2
        #separate into two arrays, needstobeP and needstobeD
        needsToBePlaintiff = [] #teams that were just Defense
        needsToBeDefense = []
        tournament.rounds.where("index" => round_index - 1)[0].pairings.each do |pairing|
          needsToBePlaintiff << pairing.negs[0]
          needsToBeDefense << pairing.affs[0]
        end

        #sort by record, point diff
        needsToBePlaintiff.sort_by {|team| [team.pairing.d_ballots, -team.pairing.point_differential]} #for defense teams, a more negative point differential means that team did better.
        needsToBeDefense.sort_by {|team| [team.pairing.p_ballots, team.pairing.point_differential]}
        
        #TODO: Is there a bye team? If so, move them to the bottom of their bracket.
        proposedPairings = []

        proposedPairings = needsToBePlaintiff.zip( needsToBeDefense )
        while hasImpermissibles(proposedPairings)
          #fix impermissibles
          impermissible_index = hasImpermissibles(needsToBePlaintiff.zip( needsToBeDefense))
          #find neighboring team with least-different record; if >1: neighboring team with least-different CS; if >1 (or round 2), neighboring team with least diff point differential
          @pairing_log << ("Found impermissible: " + needsToBePlaintiff[impermissible_index].team.amtaid + " cannot face " + needsToBeDefense[impermissible_index])


          switch_set = Set.new()
          while pairerslist.include?(switch_set) and switch_set != Set.new()
            team_to_be_switched = findSwitchCandidate(comparison_method, candidates)
            impermissible_team = nil #scoping!
            if needsToBePlaintiff.include?(team_to_be_switched)
              impermissible_team = needsToBePlaintiff[impermissible_index]
              needsToBePlaintiff[needsToBePlaintiff.index(team_to_be_switched)] = impermissible_team
              needsToBePlaintiff[impermissible_index] = team_to_be_switched
            else
              impermissible_team = needsToBeDefense[impermissible_index]
              needsToBeDefense[needsToBeDefense.index(team_to_be_switched)] = impermissible_team
              needsToBeDefense[impermissible_index] = team_to_be_switched
            end
            switch_set = Set.new([impermissible_team, team_to_be_switched])
          end
          pairerslist << switch_set
          @pairing_log << ("Switched two teams: " + impermissible_team.team.school + " " +impermissible_team.team.teamabcd + " and " + team_to_be_switched.team.school + " " + team_to_be_switched.team.teamabcd )
          proposedPairings = needsToBePlaintiff.zip( needsToBeDefense)
        end
        
        puts proposedPairings.inspect
        pairings.each_with_index do |pairing, index| #TODO: Redo this to use a common scheme to translate pairings array into actual pairings
          pairing.round = round
          aff = pairing.affs.build
          neg = pairing.negs.build
          aff.team = proposedPairings[index][0].team
          neg.team = proposedPairings[index][1].team
          pairing.affs << aff
          pairing.negs << neg
          if aff.save and neg.save
            @pairing_log << "Automatically paired #{aff.amtaid} vs. #{neg.amtaid}."
          end
          if tournament.rooms && pairings.size <= tournament.rooms.size
            #assign the rooms
          end
          @pairing_log << ""
          round.tournament.pairing_log = pairing.round.tournament.pairing_log ? pairing.round.tournament.pairing_log + @pairing_log : @pairing_log
          round.tournament.save
          pairing.save
        end
      elsif round_index == 3
        pairings = []
      elsif round_index == 4
        pairings = []
      end
    #else if type == "WTFQ"
      
    end
    return true #TODO: unless things failed above
  end
end
