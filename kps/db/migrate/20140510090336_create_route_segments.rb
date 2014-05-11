class CreateRouteSegments < ActiveRecord::Migration
  def change
    create_table :route_segments do |t|
      t.integer :from_id
      t.integer :to_id
      t.boolean :active
      t.decimal :cost
      t.integer :duration
      t.decimal :costVolume
      t.decimal :costWeight
      t.integer :company_id

      t.timestamps
    end
  end
end
