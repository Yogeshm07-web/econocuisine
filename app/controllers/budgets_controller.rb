class BudgetsController < ApplicationController
  before_action :set_budget, only: [:update]

  def index
    @basket = current_user.basket
    @budgets = Budget.all
    @basket_items_price = BasketItem.all
  end

  def update
    if @budget.update(budget_params)
      render json: { status: 'success', message: 'Budget was successfully updated.' }
    else
      render json: { status: 'error', message: 'Failed to update budget.' }, status: :unprocessable_entity
    end
  end

  def budget_data
    @budget_data = [
      { name: 'My Budget for Groceries', value: 100 },
      { name: 'Total Basket Price', value: 50 },
      { name: 'Remaining Balance', value: 50 }
    ]
    render json: @budget_data
  end

  private

  def set_budget
    @budget = Budget.find_by(id: params[:id])
    unless @budget
      render json: { status: 'error', message: 'Budget not found.' }, status: :not_found
    end
  end

  def budget_params
    params.require(:budget).permit(:total_income, :total_expenses, :total_basket_price)
  end
end
