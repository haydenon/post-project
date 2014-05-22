require 'date'

module RouteSegmentsHelper
	def self.get_days
		to_r = []
		(0..6).to_a.each do |i|
			to_r << Weekday.new(i)
		end
		return to_r
	end

	class Weekday
		attr_accessor :day
		attr_accessor :name

		def initialize day
			@day = day
		end

		def name
			return Date::DAYNAMES[day]
		end
	end
end
