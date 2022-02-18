class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :description, :genre, :price, :rating, :runtime, :released, :image

  has_many :watchlists
  has_many :users, through: :watchlists
end


