class Recursivepolling < ActiveRecord::Migration
  def change
	add_column :votes, :has_cp, :string
  end
end
