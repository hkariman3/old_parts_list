class RemoveDeleteFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :delete, :boolean
  end
end
