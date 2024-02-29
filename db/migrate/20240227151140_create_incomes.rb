class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.string :source
      t.decimal :amount
      t.date :date

      t.timestamps
    end
  end
end
