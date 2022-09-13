class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4}

  has_many :order_details
  belongs_to :customer
  
  validates :delivery_address, presence: true
  validates :delivery_name, presence: true
  validates :delivery_postal_code, presence: true

end
