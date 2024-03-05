class RemoveBasketIdFromInventories < ActiveRecord::Migration[7.1]
  def change
    remove_column :inventories, :basket_id
  end
end
