class RemoveProductIdFromInventories < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :inventories, :products
  end
end
