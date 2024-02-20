class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end
end
