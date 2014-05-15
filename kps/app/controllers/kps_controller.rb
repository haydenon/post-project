class KpsController < ApplicationController
  def index
  	@requests = MailRequest.all
  end
end
