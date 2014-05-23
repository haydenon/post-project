require 'helpers/helper'
require 'helpers/figures'
require 'helpers/events'

class FiguresController < ApplicationController
	before_filter :authenticate_user!

  # GET /figures
  def index
    time = DateTime.now
    result = Figures.get_revenue_expenditure time
    @revenue = result[0]
    @expenditure = result[1]
	@events_num = Events.get_events_num time
    @event_amount_table = Figures.get_mail_ammounts time
    @avg_time_table = Figures.get_average_time time
    @critical_route_table = Figures.get_critical_routes time
  end
end