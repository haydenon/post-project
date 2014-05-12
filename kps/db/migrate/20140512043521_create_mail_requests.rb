class CreateMailRequests < ActiveRecord::Migration
  def change
    create_table :mail_requests do |t|
      t.integer :mail_route_id
      t.decimal :price
      t.decimal :weight
      t.decimal :volume
      t.integer :priority_id

      t.timestamps
    end
  end
end
