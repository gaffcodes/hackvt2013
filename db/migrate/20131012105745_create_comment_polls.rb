class CreateCommentPolls < ActiveRecord::Migration
  def change
    create_table :comment_polls do |t|
      t.string :user
      t.string :bill
      t.string :question

      t.timestamps
    end
  end
end
