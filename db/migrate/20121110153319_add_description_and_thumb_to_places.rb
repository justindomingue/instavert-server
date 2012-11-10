class AddDescriptionAndThumbToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :description, :string

    add_column :places, :thumb, :string

  end
end
