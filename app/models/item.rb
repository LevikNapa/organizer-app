class Item < ApplicationRecord
  # accepts_nested_attributes_for :list_items
  has_many :list_items
  has_many :lists, through: :list_items
end
