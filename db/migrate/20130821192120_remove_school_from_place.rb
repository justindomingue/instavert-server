class RemoveSchoolFromPlace < ActiveRecord::Migration
  def up
    remove_column :places, :school
  end

  def down
    add_column :places, :school, :integer
  end
end