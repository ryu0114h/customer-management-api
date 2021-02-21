class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :age, :integer
    remove_column :customers, :key, :string
  end
end
