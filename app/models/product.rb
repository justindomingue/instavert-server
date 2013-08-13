class Product < ActiveRecord::Base
  default_scope :order => "name ASC"
  
  attr_accessible :name, :tags
  include PgSearch
  
  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
      
  belongs_to :school      
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
