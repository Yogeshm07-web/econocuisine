class IncomesController < ApplicationController
  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to budgets_path, notice: 'Income was successfully added.'
    else
      render :new
    end
  end

  def index
    @incomes = Income.all
  end

  def show
    @income = Income.find(params[:id])
  end

  def analysis
    @total_income_amount = Income.sum(:amount)
    @total_expenses_amount = Expense.sum(:amount)
  end

  private

  def income_params
    params.require(:income).permit(:source, :amount, :date)
  end
end
