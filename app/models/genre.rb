class Genre < ApplicationRecord
  has_many :shop_items, dependent: :destroy
end
