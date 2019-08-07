class Item < ApplicationRecord
  has_many :entries
  has_many :lists, through: :entries
end
