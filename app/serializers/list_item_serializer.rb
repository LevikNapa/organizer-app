class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :list
end
