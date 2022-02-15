class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :address, :email, :phone, :password
  
end
