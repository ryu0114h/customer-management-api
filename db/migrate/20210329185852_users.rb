class Users < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :reservations, :users
    drop_table :users
  end
end
