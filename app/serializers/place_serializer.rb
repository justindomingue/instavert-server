class PlaceSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :name, :tags, :thumb, :description, :responsable, :telephone, :courriel, :local, :heure, :autre, :color
  
  def color
    rand(1..8)
  end
end