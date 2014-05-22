class Figures

	def self.get_revenue_expenditure (time)
		revenue = 0
    	expenditure = 0
    	mailrrs = MailRequestRouteSegment.where("created_at <= ?", time)
    	mailrrs.each do |mrrs|
      		revenue = revenue + mrrs.price
      		expenditure = expenditure + mrrs.cost
      	end
      	return [revenue, expenditure]
	end

	def self.get_events_to_time (time)
    	events = Event.where("created_at <= ?", time)
      	return events.size
	end

	def self.get_mail_ammounts (time)
		locs = Location.all
    	reqs = MailRequest.where("created_at <= ?", time)

    	table = []

    	locs.each do |t_loc|
    		locs.each do |f_loc|
    			next if t_loc == f_loc
    			num = 0
    			weight = 0
    			volume = 0
    			reqs.each do |req|
    				next if (req.mail_route.to_location != t_loc ||
    					req.mail_route.from_location != f_loc)
    				num = num + 1
    				weight = weight + req.weight
    				volume = volume + req.volume
    			end
    			table << [t_loc,f_loc,num,weight,volume]
    		end
    	end

      	return table
	end

end