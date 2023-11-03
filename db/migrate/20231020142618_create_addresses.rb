class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :postal_code
      t.string :telephone_number
      t.string :name
      t.timestamps
    end
  end
end
