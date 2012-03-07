class Product < ActiveRecord::Base
  attr_accessible :name, :tags
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
            
  has_and_belongs_to_many :places
end
