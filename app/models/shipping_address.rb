class ShippingAddress < ApplicationRecord
  belongs_to :member, optional: true
  #validates :postal_code, presence: { message: "can't be blank "}
  #validates :address, presence: { message: "can't be blank "}
  #validates :name, presence: { message: "can't be blank "}
end
