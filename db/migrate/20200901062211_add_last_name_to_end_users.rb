class AddLastNameToEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users, :last_name, :string
    change_column :end_users, :last_name, :string, :null => false
  end

  def down
  	remove_column :end_users, :last_name
  end
end
