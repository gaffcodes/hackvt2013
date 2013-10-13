class AddCommentTextToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :comment_text, :string
  end
end
