class AddBasketRefToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :basket, null: false, foreign_key: true
  end
end
