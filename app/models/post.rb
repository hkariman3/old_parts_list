class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :genre
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  def favorited_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  def self.search(search)
    if search
      Post.where(['name LIKE ?', "%#{search}%"])
    end
  end

end
