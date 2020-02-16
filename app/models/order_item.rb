class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :shop_item

  enum production_status:{着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3}

  #validates :order_id, presence: true
  validates :shop_item_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :production_status, presence: true

end
