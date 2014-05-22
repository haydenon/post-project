require 'helpers/helper'
require 'helpers/figures'

class FiguresController < ApplicationController

  # GET /figures
  def index
    result = Figures.get_revenue_expenditure DateTime.now
    @revenue = result[0]
    @expenditure = result[1]
  end
end