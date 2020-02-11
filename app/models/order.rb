class Order < ApplicationRecord
  belongs_to :member, optional: true
  has_many :order_items, dependent: :destroy

  enum status: { pending: 0, confirmed: 1, working: 2, preparing: 3, done: 4 }
end
