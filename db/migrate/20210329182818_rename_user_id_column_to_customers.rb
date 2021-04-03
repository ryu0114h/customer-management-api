class RenameUserIdColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :user_id, :staff_id
  end
end
