class AddDeliveryStatusToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :delivery_status, :integer
  end
end
