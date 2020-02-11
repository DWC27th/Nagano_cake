class ShopItem < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy

  has_many :cart_items, dependent: :destroy
  has_many :members, through: :cart_items

  enum sale_status: { 販売中: 0, 販売停止中: 1 }

  attachment :image

  validates :genre_id, presence: true
  validates :name, presence: true, length: {maximum: 50}
  validates :introduction, presence: true, length: {maximum: 100}
  validates :price, presence: true
  validates :sale_status, presence: true

end
