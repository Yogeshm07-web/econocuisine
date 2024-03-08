class ReviewsController < ApplicationController
  def index
    @basket_items = BasketItem.all
    # @basket_total_price = BasketItem.sum(:price)  # Total price of all basket items
    @inventory_items = Inventory.all
    
    @pie_chart_data = params[:pie_chart_data] || {}

  end

  def show
    # Fetch basket items for the current user
    @basket_items = current_user.basket_items.includes(:product)
    
    # Calculate total price of basket items
    @total_price = @basket_items.sum { |basket_item| basket_item.product.price }
  end

end
