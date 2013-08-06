class PlaceSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :name, :content, :tags, :thumb, :description
  has_many :products
end
