class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  validates :payment_method, presence: true
  validates :postal_code, presence: true #, length: { minimum: 7, maximum: 7 }
  validates :address, presence: true
  validates :name, presence: true

  enum order_status:{入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
