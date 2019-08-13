class ListItem < ApplicationRecord
  validates :content, presence: true
  belongs_to :list
  belongs_to :item
end
