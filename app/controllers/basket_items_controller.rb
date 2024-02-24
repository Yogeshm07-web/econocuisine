# class BasketItemsController < ApplicationController
  def create
    @basket_item = current_user.basket_items.build(basket_item_params)
    if @basket_item.save
      redirect_to baskets_path, notice: 'Item added to basket.'
    else
      flash[:alert] = 'Failed to add item to basket.'
      render :new  # Rendering the new action/view for creating basket items again
    end
  end

  private

  def basket_item_params
    params.require(:basket_item).permit(:product_id, :quantity)
  end
end
