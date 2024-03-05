
class ReviewsController < ApplicationController
      def index
        @expenses = Expense.last(5)
        @incomes = Income.last(5)
      end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def index
    @review=Review.all
    @expenses=Expense.all
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:feedback, :user_id)
  end
end
