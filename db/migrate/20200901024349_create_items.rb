class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :price_nontax
      t.string :image_id
      t.boolean :sale_status

      t.timestamps
    end
  end
end
