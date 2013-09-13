class DropSearchesProductsGrassetTable < ActiveRecord::Migration
  def up
    drop_table :searches
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
