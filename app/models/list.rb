class List < ApplicationRecord
  validates :title, :date, presence: true
  validate :not_a_duplicate

  belongs_to :user
  has_many :list_items
  has_many :items, through: :list_items
  accepts_nested_attributes_for :list_items

  scope :order_by_date, -> {order(date: :desc)}

  def item_attributes=(attributes)
    self.item = Item.find_or_create_by(attributes) if !attributes['description'].empty?
    self.item
  end

  def not_a_duplicate
    if !!List.find_by(title: title, date: date)
      errors.add(:title, "for your list has already been selected")
    end
  end
end
