class AddMailRouteIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :mail_route_id, :integer
  end
end
