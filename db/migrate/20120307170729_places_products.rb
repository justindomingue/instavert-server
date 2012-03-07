class PlacesProducts < ActiveRecord::Migration
  def up
    create_table :places_products, :id => false do |t|
      t.references :place, :null => false
      t.references :product, :null => false
    end
  end

  def down
    drop_table :places_products
  end
end
