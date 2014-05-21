class Priority < ActiveRecord::Base
	has_many :mail_routes, class_name: "MailRoute", :foreign_key => 'priority_id'
	has_many :mail_requests, class_name: "MailRequest", :foreign_key => 'priority_id'
	has_many :route_segments, class_name: "RouteSegment", :foreign_key => 'priority_id'

	
end
