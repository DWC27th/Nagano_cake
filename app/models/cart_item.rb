class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :shop_item

  validates :shop_item_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
