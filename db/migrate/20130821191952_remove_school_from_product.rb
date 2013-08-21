class RemoveSchoolFromProduct < ActiveRecord::Migration
  def up
    remove_column :products, :school
  end

  def down
    add_column :products, :school, :integer
  end
end

