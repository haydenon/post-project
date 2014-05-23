class CostEventController < ApplicationController
  def show
  @cost_event = CostEvent.find(params[:id])
  end
end
