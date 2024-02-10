class AddBasketRefToInventories < ActiveRecord::Migration[7.1]
  def change
    add_reference :inventories, :basket, null: false, foreign_key: true
  end
end
