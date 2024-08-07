class Like < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :customer_id, uniqueness: {scope: :post_id}
end
