class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :list_items, :category, :content
  end
end
