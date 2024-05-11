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

  validates :first_name, uniqueness: true
  validates :first_name_kana, uniqueness: true
  validates :last_name, uniqueness: true
  validates :last_name_kana, uniqueness: true
  validates :nickname, uniqueness: true
  validates :telephone_number, uniqueness: true
  validates :introduction, uniqueness: true
end
