class ProductSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name, :tags, :views
  
  has_many :places
  
end
