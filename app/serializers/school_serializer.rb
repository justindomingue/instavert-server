class SchoolSerializer < ActiveModel::Serializer 
  embed :ids, include: true
  attributes :id, :name
  
  has_many :places
  has_many :products
end
