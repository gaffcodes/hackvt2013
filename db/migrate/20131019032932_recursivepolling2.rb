class Recursivepolling2 < ActiveRecord::Migration
  def change
  	add_column :comment_polls, :votes, :integer
	add_column :comment_polls, :in_favor, :integer
  end
end
