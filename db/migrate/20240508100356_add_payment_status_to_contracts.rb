class AddPaymentStatusToContracts < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :payment_status, :integer
  end
end
