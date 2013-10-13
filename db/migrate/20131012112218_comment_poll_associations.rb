class CommentPollAssociations < ActiveRecord::Migration
  def change
	#add_column :comment_poll, :comment_id, :string
	add_column :comments, :poll_id, :integer
	add_column :comment_polls, :comment_id, :integer
  end
end
