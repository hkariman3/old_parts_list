class Contract < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  belongs_to :address
end
