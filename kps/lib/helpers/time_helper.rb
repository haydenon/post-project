require 'date'

class TimeHelper

	def self.get_next_departure (time, segment)
		fd = first_day(segment, segment.day)
		if(fd >= time)
			return fd.to_datetime
		end
		hours_since = ((time.to_time - fd.to_time)/3600%segment.frequency)
		return time + (segment.frequency-hours_since)/24
	end

	def self.first_day(segment, day)
 		date = (segment.created_at).to_date
 		if((date.cwday%7)>=day)
 			return (date.next_week-1).next_day(day).to_datetime
 		else
 			return (date.prev_week+6+day).to_datetime
 		end
	end
end
