class AddSchoolToProduct < ActiveRecord::Migration
  def change
    add_column :products, :school, :integer
  end
end
