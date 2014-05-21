class AddCostWeightToEvents < ActiveRecord::Migration
  def change
    add_column :events, :costWeight, :float
  end
end
