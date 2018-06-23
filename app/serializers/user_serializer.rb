class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :username

  belongs_to :picture
end
