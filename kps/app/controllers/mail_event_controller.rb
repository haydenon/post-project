require 'helpers/helper'
require 'date'

class MailEventController < ApplicationController
  def show
  @mail_event = MailEvent.find(params[:id])
  end
end
