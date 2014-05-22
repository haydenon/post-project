require 'helpers/helper'

class FiguresController < ApplicationController

  # GET /figures
  def index
    @mrrs = MailRequestRouteSegment.all
    @revenue = 0
    @expenditure = 0
    @mrrs.each do |mrrs|
      @revenue = @revenue + mrrs.price
      @expenditure = @expenditure + mrrs.cost
    end
  end
end