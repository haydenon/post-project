require 'action_view'
require 'helpers/time_helper'
include ActionView::Helpers::NumberHelper

class Helper
	include ActionView::Helpers::NumberHelper
	def self.decimal_as_currency (dec=0.0)
		return '$' + number_with_precision(dec, :precision => 2)
	end

	def self.time_format (time)
		return time.strftime("%d/%m/%y %H:%M%Z")		
	end

	def self.time_day (time)
		return time.strftime("%d/%m/%y")		
	end

	def self.costs_same (one,two)
		one = ((one * 100)-one%1).to_int
		two = ((two * 100)-two%1).to_int
		return one==two
	end

end