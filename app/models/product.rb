class Product < ActiveRecord::Base
  attr_accessible :name, :tags
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
end
