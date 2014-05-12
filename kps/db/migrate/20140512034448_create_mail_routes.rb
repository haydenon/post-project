class CreateMailRoutes < ActiveRecord::Migration
  def change
    create_table :mail_routes do |t|
      t.integer :to_id
      t.integer :from_id
      t.decimal :margin
      t.integer :priority_id

      t.timestamps
    end
  end
end
