class RemoveGenreFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :genre, :string
  end
end
