class ExpensesController < ApplicationController
  def create
    @expense=Expense.new(expense_params)

     @expense.save

  end
  def index
    @expense=Expense.all
  end
  def show
    @expense = Expense.find(params[:id])
  end


  private

  def expense_params
    params.permit(:category, :amount, :date, :notes)
  end
end
