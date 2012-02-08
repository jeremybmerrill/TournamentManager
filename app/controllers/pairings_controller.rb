class PairingsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /pairings
  # GET /pairings.xml
  def index
    @pairings = Pairing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pairings }
    end
  end

  # GET /pairings/1
  # GET /pairings/1.xml
  def show
    @pairing = Pairing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pairing }
    end
  end

  # GET /pairings/new
  # GET /pairings/new.xml
  def new
    @pairing = Pairing.new

    @round = Round.find(params[:round_id])
    @tournament = Tournament.find(params[:tournament_id])

    respond_to do |format|
      format.html { redirect_to( tournament_round_path(@tournament, @round) )  } 
      format.xml  { render :xml => @pairing }
    end
  end

  # GET /pairings/1/edit
  def edit
    @pairing = Pairing.find(params[:id])
  end

  # POST /pairings
  # POST /pairings.xml
  def create
    @pairing = Pairing.new(params[:pairing])
    @pairing.room = params[:room]

    aff = @pairing.affs.build
    neg = @pairing.negs.build
  
    aff.team = Team.find(params[:aff_id])
    @pairing.affs << aff

    neg.team = Team.find(params[:neg_id])
    @pairing.negs << neg


    @round = Round.find(params[:round_id])
    @tournament = Tournament.find(params[:tournament_id])

    @pairing.round = @round

    if aff.save and neg.save
      @tournament.pairing_log << "Manually paired #{aff.amtaid} vs. #{neg.amtaid} at #{Time.now}."
    end

    respond_to do |format|
      if @pairing.save
        format.html { redirect_to(tournament_round_path(@tournament, @round), :notice => 'Teams were successfully paired.') }
        format.xml  { render :xml => @round, :status => :created, :location => @round }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @round.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pairings/1
  # PUT /pairings/1.xml
  def update
    @pairing = Pairing.find(params[:id])

    respond_to do |format|
      if @pairing.update_attributes(params[:pairing])
        format.html { redirect_to(tournament_round_path(@pairing.round.tournament, @pairing.round), :notice => 'Pairing successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pairing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pairings/1
  # DELETE /pairings/1.xml
  def destroy
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @pairing = Pairing.find(params[:id])
    @pairing.destroy

    respond_to do |format|
      format.html { redirect_to(tournament_round_path(@tournament, @round), :notice => 'Pairing successfully deleted') }
      format.xml  { head :ok }
    end
  end
end

# POST /pairings
# POST /pairings.json
def post
    @pairings = Pairings.new(params[:pairings])
    
    respond_to do |format|
        if @pairings.save
            # Tell the UserMailer to send an Email to participants after save
            UserMailer.pairings_email(@participants).deliver
            
            format.html { redirect_to(@pairings, :notice => 'Pairings have been sent!') }
            format.json { render :json => @pairings, :status => :created, :location => @pairings }
            else
            format.html { render :action => "new" }
            format.json { render :json => @pairings.errors, :status => :unprocessable_entity }
        end
    end
end

