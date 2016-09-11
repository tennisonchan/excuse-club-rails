class CreateBeggings < ActiveRecord::Migration[5.0]
  def change
    create_table :beggings do |t|
      t.integer :excuse_id
      t.integer :begging_id
    end
    add_index :beggings, :excuse_id
    add_index :beggings, :begging_id
  end
end
