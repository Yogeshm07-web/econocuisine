class BudgetsController < ApplicationController
  before_action :set_budget, only: [:update]

  def index
    @basket = current_user.basket
    @budgets = Budget.all
    # @basket_total = BasketItem.sum(:price) # This calculates the total price of items in the basket
    @basket_items_price = BasketItem.all
  end

  def update
    if @budget.update(budget_params)
      redirect_to budgets_path, notice: 'Budget was successfully updated.'
    else
      render :edit
    end
  end

  def create
    budget = Budget.new(budget_params)

    if budget.save
      render json: { status: 'success', message: 'Budget data saved successfully' }, status: :ok
    else
      render json: { status: 'error', message: budget.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def set_budget
    @budget = Budget.find_by(id: params[:id])
    redirect_to budgets_path, alert: 'Budget not found.' unless @budget
  end

  def budget_params
    params.require(:budget).permit(:total_income, :total_expenses, :total_basket_price)
  end
end
