require 'helpers/helper'
require 'date'

class PriceEventController < ApplicationController
  def show
  @price_event = PriceEvent.find(params[:id])
  end
end
