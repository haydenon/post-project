class AddFrequencyToRouteSegment < ActiveRecord::Migration
  def change
    add_column :route_segments, :frequency, :integer
  end
end
