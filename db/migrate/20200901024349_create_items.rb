class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price_nontax, null: false
      t.string :image_id, null: false
      t.boolean :sale_status, null: false, default: true

      t.timestamps
    end
  end
end
