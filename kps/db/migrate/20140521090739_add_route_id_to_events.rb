class AddRouteIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :route_id, :integer
  end
end
