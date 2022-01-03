class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
    @contestants = @outing.contestants
  end
end
