class PlaceSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :name, :content, :tags, :thumb, :description
end
