class Product < ActiveRecord::Base
  attr_accessible :name, :tags
  include PgSearch
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
            
  has_and_belongs_to_many :places
  
  pg_search_scope :search_products, 
                  :against => [:name, :tags],
                  :using => {
                    :tsearch => {:prefix     => true,
                                 :dictionary => "french",
                                 :any_word => true
                    }
                  }
end
