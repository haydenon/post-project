class Location < ActiveRecord::Base
	has_many :route_to, class_name: "RouteSegment", :foreign_key => 'to_id'
	has_many :route_from, class_name: "RouteSegment", :foreign_key => 'from_id'
	validates :name, :length => { :minimum => 2}
end
