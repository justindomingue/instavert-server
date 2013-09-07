class AddColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :responsable, :string
    add_column :places, :telephone, :string
    add_column :places, :courriel, :string
    add_column :places, :local, :string
    add_column :places, :heure, :string
    add_column :places, :autre, :string
  end
end
