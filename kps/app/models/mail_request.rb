class MailRequest < ActiveRecord::Base
	belongs_to :priority, :class_name =>"Priority", :foreign_key => 'priority_id' 
	belongs_to :mail_route, :class_name =>"MailRoute", :foreign_key => 'mail_route_id'
	has_many :mail_request_route_segments, :class_name => "MailRequestRouteSegment"
	has_many :segments, :class_name => "RouteSegment", :through => :mail_request_route_segments
end
