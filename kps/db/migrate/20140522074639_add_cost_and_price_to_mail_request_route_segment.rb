class AddCostAndPriceToMailRequestRouteSegment < ActiveRecord::Migration
  def change
  	add_column :mail_request_route_segments, :cost, :decimal
  	add_column :mail_request_route_segments, :price, :decimal
  end
end
