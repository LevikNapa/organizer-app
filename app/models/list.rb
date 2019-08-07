class List < ApplicationRecord
  validates :title, :date, presence: true
  belongs_to :user
  has_many :entries
  has_many :items, through: :entries
end
