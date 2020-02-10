class ShopItem < ApplicationRecord
  belongs_to :genre
  has_many :order_items, dependent: :destroy

  has_many :cart_items, dependent: :destroy
  has_many :members, through: :cart_items

  enum sale_status: { enable: 0, disable: 1 }

  attachment :image
end
