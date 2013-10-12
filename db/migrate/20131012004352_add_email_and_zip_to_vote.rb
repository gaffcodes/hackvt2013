class AddEmailAndZipToVote < ActiveRecord::Migration
  def change
  	add_column :votes, :email, :string
  	add_column :votes, :zip, :string
  end
end
