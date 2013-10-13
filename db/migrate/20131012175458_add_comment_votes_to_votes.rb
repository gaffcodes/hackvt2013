class AddCommentVotesToVotes < ActiveRecord::Migration
  def change
	add_column :votes, :comment_id, :string
  end
end
