require 'action_view'
include ActionView::Helpers::NumberHelper

class Helper
	include ActionView::Helpers::NumberHelper
	def self.decimal_as_currency (dec=0.0)
		return '$' + number_with_precision(dec, :precision => 2)
	end
end