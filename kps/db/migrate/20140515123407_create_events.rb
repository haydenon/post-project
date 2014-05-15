class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.integer :origin_id
      t.integer :destination_id
      t.float :weight
      t.float :volume
      t.integer :priority_id
      t.float :price_per_gram
      t.float :price_per_cubic_cm
      t.integer :transport_company_id
      t.integer :transport_type_id
      t.string :depart_day
      t.float :depart_frequency
      t.float :duration

      t.timestamps
    end
  end
end
