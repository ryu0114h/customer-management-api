class AddColumnImageUrlToStaffs < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :image_url, :string
  end
end
