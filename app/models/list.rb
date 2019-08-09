class List < ApplicationRecord
  validates :title, :date, presence: true
  belongs_to :user
  has_many :list_items
  has_many :items, through: :list_items
  accepts_nested_attributes_for :items
end
  
