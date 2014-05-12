class RouteSegment < ActiveRecord::Base	
	belongs_to :toLocation, :class_name =>"Location", :foreign_key => 'to_id'
	belongs_to :fromLocation, :class_name =>"Location", :foreign_key => 'from_id'
	belongs_to :company, :class_name =>"Company", :foreign_key => 'company_id'
	has_many :mail_request_route_segments, :class_name => "MailRequestRouteSegment"
	has_many :requests, :class_name => "MailRequest", :through => :mail_request_route_segments
	
	
	validate :check_locations
	def check_locations
		errors.add(:to_id, "Location Can't be the same as the From location") if to_id == from_id
	end
	
end
