class RenameUserIdColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :user_id, :staff_id
  end
end
