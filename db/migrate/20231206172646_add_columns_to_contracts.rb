class AddColumnsToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :posts_id, :integer
    add_column :contracts, :buyer_id, :integer
  end
end
