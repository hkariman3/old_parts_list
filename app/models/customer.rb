class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :contracts, dependent: :destroy

  with_options presence: true do
    validates :first_name
  validates :first_name_kana
  validates :last_name
  validates :last_name_kana
  validates :nickname
  validates :telephone_number
  validates :introduction
  end
  
  with_options uniqueness: true do
  
  end

end
