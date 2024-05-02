class AddAddressIdToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :address_id, :integer
  end
end
