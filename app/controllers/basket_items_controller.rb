class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: [:destroy]

  def create
    @basket_item = current_user.basket_items.build(basket_item_params)
    if @basket_item.save
      redirect_to baskets_path, notice: 'Item added to basket.'
    else
      flash[:alert] = 'Failed to add item to basket.'
      render :new  # Rendering the new action/view for creating basket items again
    end
  end

  def destroy
    @basket_item.destroy
    redirect_to baskets_path, notice: 'Item removed from basket.'
  end

  private

  def set_basket_item
    @basket_item = BasketItem.find_by(id: params[:id])
    if @basket_item.nil?
      redirect_to baskets_path, alert: 'Basket item not found.'
    end
  end

  def basket_item_params
    params.require(:basket_item).permit(:product_id, :quantity, :price)
  end
end