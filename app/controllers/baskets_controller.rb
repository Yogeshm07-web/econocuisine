class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def index
    @basket = current_user.basket
    @basket_items = @basket.basket_items.includes(:product) if @basket
    @total_price = @basket_items.sum { |item| item.product.price } if @basket_items
  end

  def create
    current_user.create_basket unless current_user.basket
    redirect_to baskets_path
  end

  def show
    @basket_items = @basket.basket_items.includes(:product)
  end

  def edit
    @basket = current_user.basket
  end

  def update
    if @basket.update(basket_params)
      redirect_to @basket, notice: 'Basket was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @basket.destroy
    redirect_to baskets_url, notice: 'Basket was successfully destroyed.'
  end

  def add_to_basket
    product = Product.find(params[:product_id])
    basket = current_user.basket || current_user.create_basket
    basket_item = basket.basket_items.build(product: product)

    if basket_item.save
      redirect_to products_path, notice: "#{product.name} has been added to your basket."
    else
      redirect_to products_path, alert: "Failed to add #{product.name} to your basket."
    end
  end

  def le_wagon_supermarket
    @basket = current_user.basket || current_user.create_basket
    # Other code
  end

  private

  def set_basket
    @basket = current_user.basket
  end

  def basket_params
    params.require(:basket).permit(:quantity_bought, :product_id)
  end
end
