class ExpensesController < ApplicationController
  def create
    @expense=Expense.new(expense_params)
    
    if @expense.save
      redirect_to root_path, notice: 'Expense was successfully created.'
    else
      redirect_to root_path

    end
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
