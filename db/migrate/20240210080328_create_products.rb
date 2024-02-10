class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
