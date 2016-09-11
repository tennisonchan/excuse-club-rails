class AddPhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :email, :phone
  end
end
