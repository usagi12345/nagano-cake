class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :order_status
      t.integer :payment
      t.integer :total_price

      t.timestamps
    end
  end
end
