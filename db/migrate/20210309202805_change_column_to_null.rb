class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reservations, :customer_id, true
  end
end
