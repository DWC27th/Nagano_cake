class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :shop_items, through: :cart_items

  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  acts_as_paranoid

  validates :last_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角ひらがな・カタカナ・漢字で入力してください。" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力して下さい。" }
  validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角ひらがな・カタカナ・漢字で入力してください。" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力して下さい。" }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "は7桁の整数で入力してください。" }
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10〜11桁の整数で入力してください。" }

end