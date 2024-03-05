class BasketItemsController < ApplicationController
  before_action :set_basket_item, only: [:destroy]

  def destroy
    @basket = Basket.find(params[:basket_id])
    # @basket_item = @basket.basket_items.find(params[:id])
    @basket_item.destroy
    redirect_to @basket, notice: 'Item was successfully removed from the basket.'
  end

  private

  def set_basket_item
    @basket_item = BasketItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to baskets_path, alert: 'Basket item not found.'
  end

  def basket_item_params
    params.require(:basket_item).permit(:product_id, :quantity, :price)
  end
end