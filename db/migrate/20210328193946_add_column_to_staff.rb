class AddColumnToStaff < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :postal_code, :string
    add_column :staffs, :address, :string
    add_column :staffs, :introduction_text, :string
    remove_column :staffs, :nickname, :string
  end
end
