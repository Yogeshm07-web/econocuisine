class RemoveQuantityBoughtAndProductIdFromBaskets < ActiveRecord::Migration[7.1]
  def change
    remove_column :baskets, :quantity_bought, :integer
    remove_column :baskets, :product_id, :bigint
  end
end
