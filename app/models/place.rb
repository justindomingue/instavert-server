class Place < ActiveRecord::Base
  default_scope :order => "name ASC"
  
  attr_accessible :name, :tags, :thumb, :description, :responsable, :telephone, :courriel, :local, :heure, :autre, :product_ids, :school_id
    
  validates :name, :presence => true
  # validates :products, presence:true
  
  belongs_to :school
  has_and_belongs_to_many :products
  
end


