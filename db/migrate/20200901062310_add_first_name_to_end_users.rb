class AddFirstNameToEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users, :first_name, :string
    change_column :end_users, :first_name, :string, :null => false
  end

  def down
  	remove_column :end_users, :first_name
  end
end
