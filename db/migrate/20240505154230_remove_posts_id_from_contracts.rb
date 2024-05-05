class RemovePostsIdFromContracts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :posts_id, :integer
  end
end
