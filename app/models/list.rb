class List < ApplicationRecord
  validates :title, :date, presence: true
  belongs_to :user
  has_many :list_items
  has_many :items, through: :list_items
end
