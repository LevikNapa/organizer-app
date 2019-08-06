class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.datetime :date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
