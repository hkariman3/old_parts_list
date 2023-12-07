class AddCustomerIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :customer_id, :integer
  end
end
