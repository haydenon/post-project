class RouteSegment < ActiveRecord::Base	
	belongs_to :to_location, :class_name =>"Location", :foreign_key => 'to_id'
	belongs_to :from_location, :class_name =>"Location", :foreign_key => 'from_id'
	belongs_to :company, :class_name =>"Company", :foreign_key => 'company_id'
	has_many :mail_request_route_segments, :class_name => "MailRequestRouteSegment"
	has_many :requests, :class_name => "MailRequest", :through => :mail_request_route_segments
	
	validate :check_validation
	
	def check_validation
		errors.add(:to_id, "Location Can't be the same as the From location") if to_id == from_id
		errors.add(:day, "Not a valid day integer must be 0 - 6") if day >= 7 or day < 0
		errors.add(:frequency, "Frequency must be greater than 0") if frequency < 1	
		errors.add(:duration, "Duration must be greater than 0") if duration < 1	
		errors.add(:cost, "Cost must be greater than 0") if cost < 1	
	end
end
