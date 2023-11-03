class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.string :total_price
      t.string :postage
      t.string :name
      t.string :address
      t.string :postal_code
      t.timestamps
    end
  end
end
