class AddPostCompletionToMailRequests < ActiveRecord::Migration
  def change
  	add_column :mail_requests, :post_completion_at, :datetime
  end
end
