class ChangeEntriesToListItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :entries, :list_items
  end
end
