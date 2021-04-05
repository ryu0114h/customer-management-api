class RemoveColumnImageToStaffs < ActiveRecord::Migration[6.1]
  def change
    remove_column :staffs, :image, :string
  end
end
