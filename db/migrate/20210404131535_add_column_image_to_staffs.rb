class AddColumnImageToStaffs < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :image, :string
  end
end
