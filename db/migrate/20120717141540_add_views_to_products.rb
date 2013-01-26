class AddViewsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :views, :integer
  end
 
  def self.down
    remove_column :products, :integer
  end
end
