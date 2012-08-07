namespace :scenarios do
  desc "Truncate all"
  task :truncate => :environment do
    Tournament.all.each do |t|
      t.destroy
    end
    Team.all.each do |t|
      t.destroy
    end
    Round.all.each do |r|
      r.destroy
    end
  end


  desc "Load test tournament and teams into the database"
  task :load_tournament => :environment do
    if ! User.find(1)
      u = God.new
      u.update_attributes({:email => "jeremy@jeremybmerrill.com", :password => "password", :password_confirmation => "password"})
      u.save
    end

    t = Tournament.new
    t.update_attributes({:title => "Test Tournament", :location => "Testing Database", :type_of_competition => "AMTA", :number_of_rounds => 4, :info => "", :host => "Ruby on Rails", :num_rounds => 4, :start_date => Time.now, :end_date => Time.now + 4.days, :owner_id => 1})
    (1..t.num_rounds).each do |n|
      t.rounds.build(:index => n)
    end

    t1 = Team.new
    t2 = Team.new
    t3 = Team.new
    t4 = Team.new
    t5 = Team.new
    t6 = Team.new
    t7 = Team.new
    t8 = Team.new
    t9 = Team.new
    t10 = Team.new
    t11 = Team.new
    t12 = Team.new

    t1.update_attributes({:amtaid => "1111", :school => "CMC", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t2.update_attributes({:amtaid => "1112", :school => "Pomona", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t3.update_attributes({:amtaid => "1113", :school => "Scripps", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t4.update_attributes({:amtaid => "1114", :school => "UCLA", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t5.update_attributes({:amtaid => "1115", :school => "USC", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t6.update_attributes({:amtaid => "1116", :school => "UNC", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t7.update_attributes({:amtaid => "1117", :school => "BRB", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t8.update_attributes({:amtaid => "1118", :school => "LOL", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t9.update_attributes({:amtaid => "1119", :school => "WTF", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t10.update_attributes({:amtaid => "1120", :school => "Liberty U.", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t11.update_attributes({:amtaid => "1121", :school => "NYT", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })
    t12.update_attributes({:amtaid => "1122", :school => "GOOG", :teamabcd => "A", :contactemail => "user@server.com", :contactphone => "12345566" })

    t1.save; t.teams << t1
    t2.save; t.teams << t2
    t3.save; t.teams << t3
    t4.save; t.teams << t4
    t5.save; t.teams << t5
    t6.save; t.teams << t6
    t7.save; t.teams << t7
    t8.save; t.teams << t8
    t9.save; t.teams << t9
    t10.save; t.teams << t10
    t11.save; t.teams << t11
    t12.save; t.teams << t12
    t.save
  end

  desc "Randomly fill all the fillable fields for all of the pairings within the given round, given by id"
  task :fill_ballot => :environment do
    round_id = ARGV[1]
    round = Round.find(round_id)
    round.pairings.each do |p|
      p.p_open = rand(1..10)

      p.p_open = rand(1..10)
      p.d_open = rand(1..10)
      p.p_witness_1 = rand(1..10)
      p.p_dx_1 = rand(1..10)
      p.d_cx_1 = rand(1..10)
      p.p_witness_2 = rand(1..10)
      p.p_dx_2 = rand(1..10)
      p.d_cx_2 = rand(1..10)
      p.p_witness_3 = rand(1..10)
      p.p_dx_3 = rand(1..10)
      p.d_cx_3 = rand(1..10)
      p.d_witness_1 = rand(1..10)
      p.d_dx_1 = rand(1..10)
      p.p_cx_1 = rand(1..10)
      p.d_witness_2 = rand(1..10)
      p.d_dx_2 = rand(1..10)
      p.p_cx_2 = rand(1..10)
      p.d_witness_3 = rand(1..10)
      p.d_dx_3 = rand(1..10)
      p.p_cx_3 = rand(1..10)
      p.p_close = rand(1..10)
      p.d_close = rand(1..10)
      p.atty_rank_1 = 4
      p.atty_rank_2 = 3
      p.atty_rank_3 = 2
      p.atty_rank_4 = 1
      p.witness_rank_1 = 1
      p.witness_rank_2 = 2
      p.witness_rank_3 = 3
      p.witness_rank_4 = 4
      p.p_witness_1_cx = rand(1..10)
      p.p_witness_2_cx = rand(1..10)
      p.p_witness_3_cx = rand(1..10)
      p.d_witness_1_cx = rand(1..10)
      p.d_witness_2_cx = rand(1..10)
      p.d_witness_3_cx = rand(1..10)
    end
  end
end