class AddFrequencyToRouteSegment < ActiveRecord::Migration
  def change
    add_index :route_segments, :priority_id, :integer
  end
end
