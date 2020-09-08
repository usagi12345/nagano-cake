class AddFirstNameKanaToEndUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :end_users, :first_name_kana, :string
    change_column :end_users, :first_name_kana, :string, :null => false
  end

  def down
  	remove_column :end_users, :first_name_kana
  end
end
