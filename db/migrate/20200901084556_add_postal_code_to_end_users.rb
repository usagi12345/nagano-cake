class AddPostalCodeToEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users, :postal_code, :string
    change_column :end_users, :postal_code, :string, :null => false
  end

  def down
  	remove_column :end_users, :postal_code
  end
end
