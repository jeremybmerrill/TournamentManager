class AffsController < ApplicationController

  def create
    @aff = Aff.new
    @aff.team = Team.find(params[:aff_id])
    @aff.save
  end
end

