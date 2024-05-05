class AddCustomerIdToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :customer_id, :integer
  end
end
