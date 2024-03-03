class AddUnitToInventories < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :unit, :string
  end
end
