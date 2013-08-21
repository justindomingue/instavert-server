class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school_id, :integer
    add_column :users, :contact_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :city, :string
  end
end
