class List < ApplicationRecord
  validates :title, :date, presence: true
  validate :not_a_duplicate

  belongs_to :user
  has_many :list_items
  has_many :items, through: :list_items
  accepts_nested_attributes_for :items

  scope :order_by_date, -> {order(date: :desc)}

  def items_attributes=(item_attributes)

     item_attributes.values.each do |item_attribute|
      item = Item.find_or_create_by(description: item_attribute['description'])
      self.items << item unless self.items.include?(item)

     item_attribute[:list_items_attributes].values.each do |list_item_attribute|

       if self.list_items.any? do |list_item|
        list_item.list_id == self.id && list_item.item_id == item.id
       end
        list_item = self.list_items.select do |li|
          # binding.pry
        li.item_id == item.id && li.list_id == self.id
        # binding.pry
       end.first
        list_item.content = list_item_attribute.values.first unless list_item_attribute.blank?
        list_item.save
       else
        list_item = self.list_items.select {|li| li.item_id == item.id}.first
        list_item.content = list_item_attribute unless list_item_attribute.blank?
        list_item.save

        end
      end
    end
  end




  # def list_items_attributes=(list_item_attributes)
  #    list_item_attributes.values.each do |list_item_attribute|
  #      binding.pry
  #     list_item = ListItem.find_or_create_by(list_item_attribute)
  #     self.list_items << list_item
  #   end
  # end

  def not_a_duplicate
    if !!List.find_by(title: title, date: date)
      errors.add(:title, "for your list has already been selected")
    end
  end
end
