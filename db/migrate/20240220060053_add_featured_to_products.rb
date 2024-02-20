class AddFeaturedToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :featured, :boolean
  end
end
