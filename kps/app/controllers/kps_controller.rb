class KpsController < ApplicationController
	before_filter :authenticate_user!

  def index
  	if (Priority.find_by_id(1).nil?)
  		Priority.create(:name => 'Air')
  		Priority.create(:name => 'Land')
  		Priority.create(:name => 'Sea')
  	end
  	@requests = MailRequest.all
  end

  def help
  end

end
