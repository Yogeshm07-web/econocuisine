class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.references :basket, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end