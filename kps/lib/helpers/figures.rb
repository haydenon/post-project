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

	#Returns an array of arrays in this format:
	#[[to,from,tnum,tweight,tvolume],[to,from,tnum,tweight,tvolume]]
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
    			table << [t_loc,f_loc,num,weight,volume] if (num>0 || weight>0 || volume>0)
    		end
    	end

      	return table
	end

	#Returns an array of arrays in this format:
	#[[to,from,priority,avghours][to,from,priority,avghours]]
	def self.get_average_time (time)
		routes = MailRoute.all

		table = []

		routes.each do |route|
			num = 0
			total_time = 0
			route.mail_requests.each do |req|
				next if req.created_at > time
				num = num + 1
				total_time = total_time + (req.post_completion_at - req.created_at)
			end
			avg_time = total_time/num if num>0
			table << [route.to_location,route.from_location,
				route.priority,avg_time] if num>0
		end
		return table
	end

	#Returns an array of arrays in this format:
	#[[to,from,priority,company,rev-exp][to,from,priority,company,rev-exp]]
	def self.get_critical_routes (time)
		segments = RouteSegment.all

		table = []

		segments.each do |seg|
			exp = 0
			rev = 0
			mailrrs = MailRequestRouteSegment.where("created_at <= ? AND route_segment_id = ?", time, seg.id)
			mailrrs.each do |mrrs|
				exp = exp + mrrs.cost
				rev = rev + mrrs.price
			end
			table << [seg.to_location, seg.from_location, seg.priority, seg.company, rev-exp] if exp > rev
		end
		return table
	end

end