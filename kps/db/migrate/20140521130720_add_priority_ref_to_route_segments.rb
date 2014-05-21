class AddPriorityRefToRouteSegments < ActiveRecord::Migration
  def change
    add_reference :route_segments, :priority, index: true
  end
end
