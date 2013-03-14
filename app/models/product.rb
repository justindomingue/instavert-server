class Product < ActiveRecord::Base
  attr_accessible :name, :tags
  accepts_nested_attributes_for :products 
  include PgSearch
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
            
  has_and_belongs_to_many :places
  
  pg_search_scope :search_products, 
                  :against => [:name, :tags],
                  :using => {
                    :tsearch => { # :prefix     => true, postgresql >= 8.4 
                                 :dictionary => "french",
                                 :any_word => true
                    }
                  }
end
