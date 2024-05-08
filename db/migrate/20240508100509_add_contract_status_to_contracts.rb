class AddContractStatusToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :contract_status, :integer
  end
end
