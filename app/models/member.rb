class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :shop_items, through: :cart_items

  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy


  enum member_status: {有効会員:0, 無効:1}

  acts_as_paranoid
end
