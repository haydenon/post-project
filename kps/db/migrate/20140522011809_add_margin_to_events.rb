class AddMarginToEvents < ActiveRecord::Migration
  def change
    add_column :events, :margin, :float
  end
end
