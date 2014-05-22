class HomeController < ApplicationController
	def index
		if user_signed_in?
			redirect_to :controller=> 'kps', :action => 'index'
		end
	end
	
	def show
	
	end

end
