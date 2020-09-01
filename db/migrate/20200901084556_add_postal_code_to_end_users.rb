class AddPostalCodeToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :postal_code, :string
  end
end
