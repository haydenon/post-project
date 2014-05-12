class Priority < ActiveRecord::Base
	has_many :mail_route, class_name: "MailRoute", :foreign_key => 'priority_id'
	has_many :mail_request, class_name: "MailRequest", :foreign_key => 'priority_id'
	
end
