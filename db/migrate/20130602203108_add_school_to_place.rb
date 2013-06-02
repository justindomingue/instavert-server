class AddSchoolToPlace < ActiveRecord::Migration
  def change
    add_column :places, :school, :integer
  end
end
