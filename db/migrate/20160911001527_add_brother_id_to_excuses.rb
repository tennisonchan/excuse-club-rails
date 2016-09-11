class AddBrotherIdToExcuses < ActiveRecord::Migration[5.0]
  def change
    add_column :excuses, :brother_id, :integer
    add_index :excuses, :brother_id
  end
end
