class AddLastNameKanaToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :last_name_kana, :string
  end
end
