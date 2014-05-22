require 'helpers/helper'
require 'helpers/figures'

class FiguresController < ApplicationController

  # GET /figures
  def index
    time = DateTime.now
    result = Figures.get_revenue_expenditure time
    @revenue = result[0]
    @expenditure = result[1]
    @events = Figures.get_events_to_time time
  end
end