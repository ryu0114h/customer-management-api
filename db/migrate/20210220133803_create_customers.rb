class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :key
      t.string :firstName
      t.string :lastName
      t.string :address
      t.string :memo

      t.timestamps
    end
  end
end
