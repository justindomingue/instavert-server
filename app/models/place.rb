class Place < ActiveRecord::Base
  default_scope :order => "name ASC"
  
  attr_accessible :name, :content, :tags, :thumb, :description, :product_ids
  include PgSearch
  
  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  
  belongs_to :school
  has_and_belongs_to_many :products
  
  pg_search_scope :search_places, 
                  :against => [:name, :tags, :content],
                  :using => {
                    :tsearch => {#:prefix     => true, postgresql >= 8.4 
                                 :dictionary => "french",
                                 :any_word => true
                    }
                  }
end


