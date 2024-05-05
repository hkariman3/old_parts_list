class Address < ApplicationRecord
  belongs_to :customer
  has_many :contracts, dependent: :destroy
end
