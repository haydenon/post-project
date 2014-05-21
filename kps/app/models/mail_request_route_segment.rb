class MailRequestRouteSegment < ActiveRecord::Base
	belongs_to :request, :class_name =>"MailRequest", :foreign_key => 'mail_request_id' 
	belongs_to :segment, :class_name =>"RouteSegment", :foreign_key => 'route_segment_id' 
	
	validate :check_validation
	def check_validation
		errors.add(:mail_request_id, "does not exist") if (!MailRequest.exists?(mail_request_id))
		errors.add(:route_segment_id, "does not exist") if (!RouteSegment.exists?(route_segment_id))
	end
	
end
