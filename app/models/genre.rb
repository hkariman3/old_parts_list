class Genre < ApplicationRecord
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
end
