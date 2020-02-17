class ShippingAddress < ApplicationRecord
  belongs_to :member

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "は7桁の整数で入力してください。" }
  validates :address, presence: true
  validates :name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角ひらがな・カタカナ・漢字で入力してください。" }

end
