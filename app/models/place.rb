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
  
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false }
end


