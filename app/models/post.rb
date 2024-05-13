class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :genre
  belongs_to :customer
  has_many :contracts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :images, presence: true
  

  def favorited_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  def self.search(search)
    if search
      Post.where(['name LIKE ?', "%#{search}%"])
    end
  end

end
