class AddViewsToPlaces < ActiveRecord::Migration
  def self.up
    add_column :places, :views, :integer
  end
 
  def self.down
    remove_column :places, :integer
  end
end
