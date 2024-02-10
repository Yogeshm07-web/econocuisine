class AddNameToInventories < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :name, :string
  end
end
