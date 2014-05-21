class AddDayToRouteSegment < ActiveRecord::Migration
  def change
    add_column :route_segments, :day, :integer
  end
end
