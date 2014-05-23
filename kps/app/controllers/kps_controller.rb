class KpsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@requests = MailRequest.all
  end

  def help
  end

end
