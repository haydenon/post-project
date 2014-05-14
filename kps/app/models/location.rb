class Location < ActiveRecord::Base
	has_many :to_routes, class_name: "RouteSegment", :foreign_key => 'to_id'
	has_many :from_routes, class_name: "RouteSegment", :foreign_key => 'from_id'
	has_many :to_mail_routes, class_name: "MailRoute", :foreign_key => 'to_id'
	has_many :from_mail_routes, class_name: "MailRoute", :foreign_key => 'from_id'
	validates :name, :length => { :minimum => 2}
end
