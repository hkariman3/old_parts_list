class RemoveDetailsFromContracts < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :total_price, :string
    remove_column :contracts, :name, :string
    remove_column :contracts, :address, :string
    remove_column :contracts, :postal_code, :string
  end
end
