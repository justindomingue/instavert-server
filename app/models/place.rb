class Place < ActiveRecord::Base
  default_scope :order => "name ASC"
  
  attr_accessible :name, :tags, :thumb, :description, :responsable, :telephone, :courriel, :local, :heure, :autre, :product_ids
    
  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :products, presence:true
  
  belongs_to :school
  has_and_belongs_to_many :products
  
end


