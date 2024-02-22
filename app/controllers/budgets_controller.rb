class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to budgets_path, notice: 'Budget was successfully updated.'
    else
      render :edit
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :amount) # Adjust permitted parameters as per your model
  end
end
