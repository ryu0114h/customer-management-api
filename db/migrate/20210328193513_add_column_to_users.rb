class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :introduction_text, :text
    remove_column :users, :nickname, :string
  end
end
