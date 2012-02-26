class AmtaBallotsController < ApplicationController
  # GET /amta_ballots
  # GET /amta_ballots.xml
  def index
    @amta_ballots = AmtaBallot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @amta_ballots }
    end
  end

  # GET /amta_ballots/1
  # GET /amta_ballots/1.xml
  def show
    @amta_ballot = AmtaBallot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @amta_ballot }
    end
  end

  # GET /amta_ballots/new
  # GET /amta_ballots/new.xml
  def new
    @amta_ballot = AmtaBallot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @amta_ballot }
    end
  end

  # GET /amta_ballots/1/edit
  def edit
    @amta_ballot = AmtaBallot.find(params[:id])
  end

  # POST /amta_ballots
  # POST /amta_ballots.xml
  def create
    @amta_ballot = AmtaBallot.new(params[:amta_ballot])
    @pairing = Pairing.find(params[:pairing_id])
    @pairing.amta_ballots << @amta_ballot
    @round = Round.find(params[:round_id])
    @tournament = Tournament.find(params[:tournament_id])

    respond_to do |format|
      if @amta_ballot.save
        format.html { redirect_to( tournament_round_path(@tournament, @round), :notice => 'Amta ballot was successfully created.') }
        format.xml  { render :xml => @amta_ballot, :status => :created, :location => @amta_ballot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @amta_ballot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /amta_ballots/1
  # PUT /amta_ballots/1.xml
  def update
    @amta_ballot = AmtaBallot.find(params[:id])

    respond_to do |format|
      if @amta_ballot.update_attributes(params[:amta_ballot])
        format.html { redirect_to(@amta_ballot, :notice => 'Amta ballot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @amta_ballot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /amta_ballots/1
  # DELETE /amta_ballots/1.xml
  def destroy
    @amta_ballot = AmtaBallot.find(params[:id])
    @amta_ballot.destroy

    respond_to do |format|
      format.html { redirect_to(amta_ballots_url) }
      format.xml  { head :ok }
    end
  end
end
