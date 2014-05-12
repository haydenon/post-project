class MailRequestRouteSegment < ActiveRecord::Base
	belongs_to :request, :class_name =>"MailRequest", :foreign_key => 'mail_request_id' 
	belongs_to :segment, :class_name =>"RouteSegment", :foreign_key => 'route_segment_id' 
end
