class Address < ApplicationRecord
  belongs_to :customer
  has_many :contracts, dependent: :destroy
  
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :telephone_number, presence: true
end
