class CreateMailRequestRouteSegments < ActiveRecord::Migration
  def change
    create_table :mail_request_route_segments do |t|
      t.integer :route_segment_id
      t.integer :mail_request_id

      t.timestamps
    end
  end
end
