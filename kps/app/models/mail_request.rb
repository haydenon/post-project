class MailRequest < ActiveRecord::Base
	belongs_to :priority, :class_name =>"Priority", :foreign_key => 'priority_id' 
	belongs_to :mail_route, :class_name =>"MailRoute", :foreign_key => 'mail_route_id'
	has_many :MailRequest_RouteSegments
	has_many :RouteSegments, through: :MailRequest_RouteSegments
end
