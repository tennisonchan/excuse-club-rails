class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :token
end
