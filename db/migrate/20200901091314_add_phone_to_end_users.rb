class AddPhoneToEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users, :phone, :string
    change_column :end_users, :phone, :string, :null => false
  end

  def down
  	remove_column :end_users, :phone
  end
end