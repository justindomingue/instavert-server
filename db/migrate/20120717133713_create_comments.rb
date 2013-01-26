class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.string :status

      t.timestamps
    end
  end
end
