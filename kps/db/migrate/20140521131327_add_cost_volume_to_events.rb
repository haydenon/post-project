class AddCostVolumeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :costVolume, :float
  end
end
