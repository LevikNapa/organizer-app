class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :date
  has_many :list_items
end
