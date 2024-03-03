class AddColumnsToBasketItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :basket_items, :basket, null: false, foreign_key: true
    add_reference :basket_items, :product, null: false, foreign_key: true
    add_column :basket_items, :quantity, :integer
  end
end
