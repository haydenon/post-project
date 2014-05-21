class AddReversedToMailRequestRouteSegment < ActiveRecord::Migration
  def change
    add_column :mail_request_route_segments, :reversed, :boolean
  end
end
