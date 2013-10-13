class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :bill
      t.string :question
      t.integer :creator_id

      t.timestamps
    end
  end
end
