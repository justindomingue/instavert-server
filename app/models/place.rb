# == Schema Information
#
# Table name: places
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  content    :string(255)
#  tags       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Place < ActiveRecord::Base
  attr_accessible :name, :content, :tags
  include PgSearch
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }

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


