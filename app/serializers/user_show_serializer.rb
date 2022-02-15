class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :address, :email, :phone, :password, :movies
  has_many :movies
end
