class RemoveBuyerIdFromContracts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :buyer_id, :integer
  end
end
