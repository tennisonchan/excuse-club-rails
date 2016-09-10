class CreateExcuses < ActiveRecord::Migration[5.0]
  def change
    create_table :excuses do |t|
      t.integer :user_id
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps

      t.index :user_id
    end
  end
end
