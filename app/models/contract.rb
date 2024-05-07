class Contract < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  belongs_to :address
  
  enum payment_status: {before_payment: 0, after_payment: 1, delivered: 2}, _default: "before_payment"
  enum delivery_status: {waiting_payment: 0, shipped: 1}, _default: "waiting_payment"
  enum contract_status: { uncompleted: 0, completed: 1}, _default: "uncompleted"
end
