class AddPhoneToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :phone, :string
  end
end
