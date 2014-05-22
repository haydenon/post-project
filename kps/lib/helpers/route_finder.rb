require 'helpers/time_helper'
require 'helpers/priority_queue'

class RouteFinder
	@air_set = [1].to_set
	@standard_set = [2,3].to_set
	attr_accessor :loc_to_wrap

	def self.find_route (to, from, time, air=false, segments)
		#initialisation
		@loc_to_wrap = Hash.new()
		pq = PriorityQueue.new()
		visited = Set.new()
		start = wrap(from)
		start.arrive = time
		start_wrap = QueueHolder.new(start,true,time, nil, nil)
		pq.add(start_wrap)

		#start algorithm
		while !pq.empty? do

			if(pq.empty?)#in the event that there's no path
				return nil
			elsif(wrap(to)==pq.peek.loc_wrap)
				#found it, perform wrap up
				last = pq.remove
				cur = last.loc_wrap
				cur.arrive = last.arrive
				cur.from = last.from
				cur.to_seg = last.to_seg
				route = []
				while cur.from!=nil do
					route << cur.to_seg
					cur = cur.from
				end
				return [route.reverse,last.arrive]
			else #remove node, add to visited and add
				 #all unvisited neighbours to queue
				node = pq.remove
				inner = node.loc_wrap
				next if [inner].to_set.subset? visited
				inner.from = node.from
				inner.arrive = node.arrive
				inner.to_seg = node.to_seg
				visited.add(inner)
				inner.loc.to_routes.each do |seg|
					seg_wrap = wrap(seg.from_location)
					next if (!seg.active || ([seg_wrap].to_set.subset? visited))
					seg_priority = [seg.priority_id].to_set.subset? @air_set
					seg_priority = air ? seg_priority : !seg_priority
					pq.add(QueueHolder.new(seg_wrap, seg_priority,
						arrival_time(inner.arrive,seg), inner, seg))
				end
				inner.loc.from_routes.each do |seg|
					seg_wrap = wrap(seg.to_location)
					next if (!seg.active || ([seg_wrap].to_set.subset? visited))
					seg_priority = [seg.priority_id].to_set.subset? @air_set
					seg_priority = air ? seg_priority : !seg_priority
					pq.add(QueueHolder.new(seg_wrap, seg_priority,
						arrival_time(inner.arrive,seg), inner, seg))
				end
			end
		end
		return nil
	end

	def self.arrival_time (time, segment)
		dep_time = TimeHelper.get_next_departure(time, segment)
		arr_time = (dep_time.to_time + 3600*segment.duration).to_datetime
		return arr_time
	end

	def self.wrap (loc)
		@loc_to_wrap[loc] = LocWrap.new(loc) if !@loc_to_wrap.has_key?(loc)
		return @loc_to_wrap[loc]
	end
end

class LocWrap
	attr_accessor :loc
	attr_accessor :from
	attr_accessor :arrive
	attr_accessor :to_seg


	def initialize (location, from=nil, arrive=nil)
		@loc = location
		@from = from
	end
end

class QueueHolder
	attr_accessor :loc_wrap
	attr_accessor :is_priority
	attr_accessor :arrive
	attr_accessor :from
	attr_accessor :to_seg


	def initialize (loc_wrap, is_priority, arrive, from, to_seg)
		@loc_wrap = loc_wrap
		@is_priority = is_priority
		@arrive = arrive
		@from = from
		@to_seg = to_seg
	end

	# def <=> (other)
	# 	if !is_priority && other.is_priority
	# 		return -1;
	# 	elsif is_priority && !other.is_priority
	# 		return 1;
	# 	else
	# 		return 0;
	# 	end
	# end

	def < (other)
		if(is_priority = other.is_priority)
			return arrive < other.arrive
		else return !is_priority
		end
	end

	def > (other)
		if(is_priority = other.is_priority)
			return arrive > other.arrive
		else return is_priority
		end
	end

	def <= (other)
		if(is_priority = other.is_priority)
			return arrive <= other.arrive
		else return !is_priority
		end
	end

	def >= (other)
		if(is_priority = other.is_priority)
			return arrive >= other.arrive
		else return is_priority
		end
	end
end