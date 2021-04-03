class ChangeCustomersToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :customers, :users
  end
end
