class IncomesController < ApplicationController
  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path, notice: 'Expense was successfully created.'
    else
      redirect_to root_path

    end
  def index
    @income=Income.all
  end
  def show
    @income = Income.find(params[:id])
  end


  private

  def income_params
    params.permit(:source, :Iamount, :Idate)
  end
end
end
