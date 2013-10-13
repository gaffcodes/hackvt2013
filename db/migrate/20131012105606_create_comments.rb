class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.string :bill
      t.string :text
      t.string :date

      t.timestamps
    end
  end
end
