class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.boolean :presence

      t.timestamps
    end
  end
end
