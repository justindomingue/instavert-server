class School < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  has_many :products
  has_many :places
  belongs_to :user
end
