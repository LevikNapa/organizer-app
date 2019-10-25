class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :list
  belongs_to :item
end
