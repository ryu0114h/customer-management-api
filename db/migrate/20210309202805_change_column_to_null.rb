class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reservations, :staff_id, true
  end
end
