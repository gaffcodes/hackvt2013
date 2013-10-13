class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :user_id
      t.boolean :in_favor

      t.timestamps
    end
  end
end
