class Company < ActiveRecord::Base
	has_many :route_segments, :class_name =>"RouteSegment", :foreign_key => 'company_id'
end