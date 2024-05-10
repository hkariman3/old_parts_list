class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :genre
  belongs_to :customer
  has_many :contracts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: { message: "価格を入力してください" }
  validates :images, presence: { message: "画像は１つ以上必要です" }, length: { minimum: 1, maximum: 5, message: "画像は5つまで投稿可能です" }
  

  def favorited_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  def self.search(search)
    if search
      Post.where(['name LIKE ?', "%#{search}%"])
    end
  end

end
