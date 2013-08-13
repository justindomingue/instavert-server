class AddSchoolIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :school_id, :integer
    add_index :products, :school_id
  end
end
