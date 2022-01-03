class ContestantsController < ApplicationController
  def show
    @contestant = Contestant.find(params[:id])
    @outings = @contestant.outings
  end
end
