class DropBasketItems < ActiveRecord::Migration[6.0]
  def change
    drop_table :basket_items
  end
end