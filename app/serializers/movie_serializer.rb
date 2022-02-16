class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :description, :genre, :price, :rating, :runtime, :released, :image

  
end


