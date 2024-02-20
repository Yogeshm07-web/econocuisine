class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @basket_items = current_user.basket_items.includes(:product)
    else
      @basket_items = []  # Assign an empty array if the user is not signed in
    end
  end


  def create
    current_basket = current_user.basket
    current_user.create_basket unless current_basket
    redirect_to baskets_path
  end

  def show
    @basket_items = Basket.find(params[:id]).basket_items.includes(:product)
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
    current_user.basket_items.create(product: product)
    redirect_to baskets_path, notice: "#{product.name} added to basket."
  end

  def le_wagon_supermarket
    @basket = current_user.basket || current_user.create_basket
    # Other code
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:quantity_bought, :product_id)
  end

  def basket_params_og
    params.require(:product).permit(:quantity_bought, :product_id) #
  end
end
