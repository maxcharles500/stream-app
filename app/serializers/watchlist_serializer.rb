class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :date_rented, :expiration, :price, :rating
  belongs_to :movie
  belongs_to :user
end
