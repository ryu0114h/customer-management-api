class DropTableUser < ActiveRecord::Migration[6.1]
  def change
    # drop_table :users
    drop_table :ar_internal_metadata
    drop_table :schema_migrations
  end
end
