class ChangeDataBooleanToResersion < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :all_day, 'boolean USING CAST(all_day AS boolean)'
    remove_column :reservations, :boolean, :string
  end
end
