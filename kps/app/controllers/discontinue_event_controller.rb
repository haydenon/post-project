class DiscontinueEventController < ApplicationController
  def show
   @discontinue_event = DiscontinueEvent.find(params[:id])
  end
end
