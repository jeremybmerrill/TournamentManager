class NegsController < ApplicationController

  def create
    @neg = Neg.new
    @neg.team = Team.find(params[:neg_id])
    @neg.save
  end

end

