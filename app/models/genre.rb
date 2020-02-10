class Genre < ApplicationRecord
  has_many :shop_items, dependent: :destroy

  enum published_status: { enable: 0, disable: 1 }
end
