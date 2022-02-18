class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :date_rented, :expiration, :price, :rating, :movie_id, :user_id
  belongs_to :movie
  belongs_to :user
end
