class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :address, :email, :phone, :password
  
  has_many :watchlists
  has_many :movies, through: :watchlists
  
end
