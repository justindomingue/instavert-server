class ProductSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name, :tags, :category
  
  has_many :places
  
  def category
    unless object.category.nil?
      object.category.gsub(/\s+/, "_").downcase
    end
  end
end
