class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :content
      t.string :tags

      t.timestamps
    end
  end
end
