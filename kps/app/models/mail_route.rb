class MailRoute < ActiveRecord::Base
	belongs_to :to_location, :class_name =>"Location", :foreign_key => 'to_id'
	belongs_to :from_location, :class_name =>"Location", :foreign_key => 'from_id'
	belongs_to :priority, :class_name =>"Priority", :foreign_key => 'priority_id'
	has_many :mail_requests, :class_name =>"MailRequest", :foreign_key => 'mail_route_id'
	
	validate :check_validation
	def check_validation
		errors.add(:to_id, "Location Can't be the same as the From location") if to_id == from_id
		errors.add(:to_id, "does not exist") if (!Location.exists?(to_id))
		errors.add(:from_id, "does not exist") if (!Location.exists?(from_id))
		errors.add(:priority_id, "does not exist") if (!Priority.exists?(priority_id))
		errors.add(:margin, "must be greater than 0") if margin == nil or margin <= 0	
	end

end
