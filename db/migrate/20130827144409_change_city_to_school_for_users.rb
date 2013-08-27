class ChangeCityToSchoolForUsers < ActiveRecord::Migration
  def change
      rename_column :users, :city, :school_name
    end
end
