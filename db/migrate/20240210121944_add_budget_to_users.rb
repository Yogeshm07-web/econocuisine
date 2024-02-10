class AddBudgetToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :budget, :integer
  end
end
