class ExpensesController < ApplicationController

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense, notice: 'Expense was successfully created.'
    else
      flash.now[:alert] = 'Failed to create expense.'
      render :new
    end
  end

  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  private

  def expense_params
    params.require(:expense).permit(:category, :amount, :date, :notes)
  end
end


