class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :member_id
      t.integer :shop_item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
