class AddOrderToMailRequestRouteSegment < ActiveRecord::Migration
  
  def changed
	add_column :mail_request_route_segments, :order, :integer
  end
end
