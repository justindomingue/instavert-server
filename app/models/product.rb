class Product < ActiveRecord::Base
  default_scope :order => "name ASC"
  
  attr_accessible :name, :tags, :place_ids, :category
    
  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :category, :presence => true
  validates :places, :presence => true
  
  belongs_to :school      
  has_and_belongs_to_many :places

end
