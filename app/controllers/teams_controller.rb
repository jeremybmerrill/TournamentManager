class TeamsController < ApplicationController

  before_filter :authenticate_user!

  # GET /teams
  # GET /teams.xml
  def index
    @teams = Team.all(:order => "school")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.xml
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.xml
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.xml
  def create
    #create competitors too
    @team = Team.new(params[:team])

    my_competitors = params[:competitors]
    (1..8).each do |n|
      if params.has_key?("captain_" + n.to_s)
        my_competitors[n-1][:captain] = true;
      else
        my_competitors[n-1][:captain] = false;
      end
    end

    my_competitors.each do |comp|
        @team.competitors.build(comp) unless comp["name"].nil? or comp["name"].empty?
    end
    @team.tournaments << Tournament.find(params[:tournament_id]) unless params[:tournament_id].empty?


    respond_to do |format|
      if @team.save
        format.html { redirect_to(@team, :notice => 'Team was successfully created.') }
        format.xml  { render :xml => @team, :status => :created, :location => @team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end


# POST /addToTournament
  # POST /addToTournament.xml
  def addToTournament
    #create competitors too
    @tournament = Tournament.find(params[:tournament_id])
	@team = Team.find(params[:id])
	
	@tournament.teams << @team 
	
    respond_to do |format|
        format.html { redirect_to(@tournament, :notice => 'Team was successfully added to the tournament.') }
        format.xml  { render :xml => @tournament, :status => :created, :location => @tournament }
    end
  end


  # PUT /teams/1
  # PUT /teams/1.xml
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to(@team, :notice => 'Team was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.xml
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to(teams_url) }
      format.xml  { head :ok }
    end
  end
end


