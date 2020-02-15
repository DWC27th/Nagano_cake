class Genre < ApplicationRecord

  has_many :shop_items, dependent: :destroy

  enum published_status: { 有効: 0, 無効: 1 }

  validates :name, presence: true, length: {maximum: 20}

end
