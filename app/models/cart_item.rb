class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :shop_item
end
