class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :member_id
      t.string :payment_method
      t.string :name
      t.string :postal_code
      t.text :address
      t.integer :order_status
      t.integer :shipping_fee

      t.timestamps
    end
  end
end
