class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :shop_item

  validates :shop_item_id, presence: true
  validates :quantity, presence: true

end
