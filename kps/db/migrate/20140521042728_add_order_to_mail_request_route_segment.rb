class AddOrderToMailRequestRouteSegment < ActiveRecord::Migration
  def change
    add_column :mail_request_route_segments, :order, :integer
  end
end
