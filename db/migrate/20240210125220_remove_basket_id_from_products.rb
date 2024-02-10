class RemoveBasketIdFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_index :products, name: "index_products_on_basket_id"

    remove_foreign_key :products, :baskets

    remove_column :products, :basket_id, :bigint, null: false
  end
end
