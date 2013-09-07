class PlaceSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :name, :tags, :thumb, :description, :responsable, :telephone, :courriel, :local, :heure, :autre
end