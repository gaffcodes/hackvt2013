class AddBillIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :bill_id, :string
  end
end
