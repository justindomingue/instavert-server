class AddSchoolIdToPlace < ActiveRecord::Migration
  def change
    add_column :places, :school_id, :integer
    add_index :places, :school_id
  end
end
