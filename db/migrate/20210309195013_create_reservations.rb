class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.bigint 'staff_id', null: false
      t.bigint 'user_id'
      t.boolean 'all_day'
      t.datetime 'start_datetime'
      t.datetime 'end_datetime'
      t.timestamps
    end
  end
end
