class AddAddressToEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users, :address, :string
    change_column :end_users, :address, :string, :null => false
  end

  def down
  	remove_column :end_users, :address
  end
end
