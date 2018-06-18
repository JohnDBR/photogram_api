class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :username, :password_digest
end
