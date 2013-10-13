class CommentsHaveCommentPolls < ActiveRecord::Migration
  def change
	add_column :comments, :make_comment_poll, :integer
  end
end
