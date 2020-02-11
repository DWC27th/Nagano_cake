class Order < ApplicationRecord
  belongs_to :member, optional: true
  has_many :order_items, dependent: :destroy
end
