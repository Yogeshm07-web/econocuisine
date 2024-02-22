class AddCategoryIdToProducts < ActiveRecord::Migration[6.1]  # Replace 6.1 with your Rails version
  def change
    add_reference :products, :category, foreign_key: true
  end
end
