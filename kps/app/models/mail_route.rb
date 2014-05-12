class MailRoute < ActiveRecord::Base
	belongs_to :toLocation, :class_name =>"Location", :foreign_key => 'to_id'
	belongs_to :fromLocation, :class_name =>"Location", :foreign_key => 'from_id'
	belongs_to :priority, :class_name =>"Priority", :foreign_key => 'priority_id'
	has_many :mailRequest, :class_name =>"MailRequest", :foreign_key => 'mail_route_id'
	
	validate :check_locations
	def check_locations
		errors.add(:to_id, "Location Can't be the same as the From location") if to_id == from_id
	end

end
