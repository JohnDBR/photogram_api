class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at

  belongs_to :picture
  belongs_to :user
end
