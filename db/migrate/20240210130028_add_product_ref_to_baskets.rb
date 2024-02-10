class AddProductRefToBaskets < ActiveRecord::Migration[7.1]
  def change
    add_reference :baskets, :product, null: false, foreign_key: true
  end
end
