class CreateBuddies < ActiveRecord::Migration[5.0]
  def change
    create_table :buddies, id: false do |t|
      t.integer :user_id
      t.integer :buddy_id

      t.index :user_id
      t.index :buddy_id
    end
  end
end
