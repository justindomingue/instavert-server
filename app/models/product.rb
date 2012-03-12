class Product < ActiveRecord::Base
  attr_accessible :name, :tags
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
            
  has_and_belongs_to_many :places
  
  include PgSearch
  pg_search_scope :search_products_by_name, :against => [:name]
  pg_search_scope :search_products_by_tags, :against => [:tags]
end
