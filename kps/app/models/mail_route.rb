class MailRoute < ActiveRecord::Base
	belongs_to :to_location, :class_name =>"Location", :foreign_key => 'to_id'
	belongs_to :from_location, :class_name =>"Location", :foreign_key => 'from_id'
	belongs_to :priority, :class_name =>"Priority", :foreign_key => 'priority_id'
	has_many :mail_request, :class_name =>"MailRequest", :foreign_key => 'mail_route_id'
	
	validate :check_locations
	def check_locations
		errors.add(:to_id, "Location Can't be the same as the From location") if to_id == from_id
	end

end
