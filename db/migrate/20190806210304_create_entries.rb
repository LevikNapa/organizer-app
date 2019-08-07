class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :category
      t.belongs_to :list, foreign_key: true
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
