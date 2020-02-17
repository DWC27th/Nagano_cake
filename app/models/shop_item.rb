class ShopItem < ApplicationRecord

  belongs_to :genre
  has_many :order_items, dependent: :destroy

  has_many :cart_items, dependent: :destroy
  has_many :members, through: :cart_items

  enum sale_status: { 販売中: 0, 売切れ: 1 }

  attachment :image

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :sale_status, presence: true

  def self.search(search)
    if search
      ShopItem.where(['name LIKE ?', "%#{search}%"])
    else
      ShopItem.all
    end
  end

end
