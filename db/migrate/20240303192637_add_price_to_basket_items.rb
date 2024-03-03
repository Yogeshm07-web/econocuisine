class AddPriceToBasketItems < ActiveRecord::Migration[7.1]
  def change
    add_column :basket_items, :price, :integer
  end
end
