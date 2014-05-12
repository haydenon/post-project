class RouteSegment < ActiveRecord::Base	
	belongs_to :toLocation, :class_name =>"Location", :foreign_key => 'to_id'
	belongs_to :fromLocation, :class_name =>"Location", :foreign_key => 'from_id'
	has_many :MailRequest_RouteSegments
	has_many :MailRequests, through: :MailRequest_RouteSegments
	validate :check_locations
	def check_locations
		errors.add(:to_id, "Location Can't be the same as the From location") if to_id == from_id
	end
	
end
