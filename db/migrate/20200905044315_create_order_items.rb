class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :number, null: false
      t.integer :production_status, null: false, default: 0
      t.integer :price, null: false

      t.timestamps
    end
  end
end
