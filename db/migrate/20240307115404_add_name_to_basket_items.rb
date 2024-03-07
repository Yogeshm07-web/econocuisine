class AddNameToBasketItems < ActiveRecord::Migration[7.1]
  def change
    add_column :basket_items, :name, :string
  end
end
