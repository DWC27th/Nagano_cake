class CreateShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_items do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :image_id
      t.integer :sale_status

      t.timestamps
    end
    add_index :shop_items, :name
  end
end
