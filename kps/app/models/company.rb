class Company < ActiveRecord::Base
	has_many :routeSegment, :class_name =>"RouteSegment", :foreign_key => 'company_id'
end
