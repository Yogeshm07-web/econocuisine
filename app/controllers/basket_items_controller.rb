class BasketItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket_item, only: [:update, :destroy]

  def create
    @basket_item = current_user.basket.basket_items.new(basket_item_params)

    if @basket_item.save
      redirect_to baskets_path, notice: 'Item was successfully added to basket.'
    else
      redirect_to products_path, alert: 'There was an error adding the item to your basket.'
    end
  end

  def update
    if @basket_item.update(basket_item_params)
      redirect_to baskets_path, notice: 'Basket item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @basket_item.destroy
    redirect_to baskets_path, notice: 'Basket item was successfully deleted.'
  end

  private

  def set_basket_item
    @basket_item = BasketItem.find(params[:id])
  end

  def basket_item_params
    params.require(:basket_item).permit(:product_id, :quantity)
  end
end