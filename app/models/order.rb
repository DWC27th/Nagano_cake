class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  enum order_status:{入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

  validates :payment_method, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "は7桁の整数で入力してください" }
  validates :address, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角ひらがな・カタカナ・漢字で入力してください" }
  validates :name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角ひらがな・カタカナ・漢字で入力してください" }

end
