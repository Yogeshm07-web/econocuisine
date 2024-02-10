class RemoveProductRefFromInventories < ActiveRecord::Migration[7.1]
  def change
    remove_index :inventories, column: :product_id
    remove_column :inventories, :product_id, :bigint, null: false
  end
end
