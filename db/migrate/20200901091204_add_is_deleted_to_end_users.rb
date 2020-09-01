class AddIsDeletedToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :is_deleted, :boolean
  end
end
