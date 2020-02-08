class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :member_id
      t.string :name
      t.string :postal_code
      t.text :address

      t.timestamps
    end
  end
end
