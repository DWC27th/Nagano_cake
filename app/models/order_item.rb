class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :shop_item
end
