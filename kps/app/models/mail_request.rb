class MailRequest < ActiveRecord::Base
	belongs_to :priority, :class_name =>"Priority", :foreign_key => 'priority_id' 
	belongs_to :mail_route, :class_name =>"MailRoute", :foreign_key => 'mail_route_id'
	has_many :mail_request_route_segments, :class_name => "MailRequestRouteSegment", :dependent => :destroy
	has_many :segments, :class_name => "RouteSegment", :through => :mail_request_route_segments

	attr_accessor :to_id #FOR FORM USE ONLY
	attr_accessor :from_id #FOR FORM USE ONLY
	attr_accessor :found_route #FOR USE IN CONTROLLER ONLY
	
	validate :check_validation
	def check_validation
		errors.add(:to_id, "- Location Can't be the same as the From location") if to_id == from_id
		errors.add(:priority_id, "- Does not exist") if (!Priority.exists?(priority_id))
		errors.add(:to_id, "- No route between locations") if !found_route
		errors.add(:weight, "- Weight must be greater than zero") if weight<=0
		errors.add(:volume, "- Volume must be greater than zero") if volume<=0
	end
end
