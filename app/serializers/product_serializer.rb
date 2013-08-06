class ProductSerializer < ActiveModel::Serializer
  attributes :name, :tags, :views, :school
  
end
