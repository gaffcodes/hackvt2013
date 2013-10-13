class ModifyComment < ActiveRecord::Migration
  def change
	remove_column :comments, :user
	add_column :comments, :user_id, :string
  end
end
