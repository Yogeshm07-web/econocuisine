class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def index
    
    if current_user.basket.present?
      @basket_items = Basket.where(user: current_user)
    else
      redirect_to root_path, alert: "You do not have a basket yet."
    end
    # @basket = current_user.basket
    # @basket_items_count = @basket&.basket_items&.count || 0
  end

  def create
    current_basket = current_user.basket
    current_user.create_basket unless current_basket
    redirect_to baskets_path
  end

  def show
    # The @basket instance variable is already set in the set_basket method
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
    product = Product.find_by(id: params[:product_id])
    if product
      basket = Basket.new(basket_params_og)
      basket.user= current_user
      basket.save
      # current_basket = current_user.basket || current_user.create_basket
      # current_basket.add_product(product)
      # redirect_to basket_path(current_basket), notice: "#{product.name} added to basket successfully."
    else
      redirect_to root_path, alert: "Product not found."
    end
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
    params.require(:basket).permit(:quantity_bought) # Fixing typo here
  end

  def basket_params_og
    params.require(:product).permit(:quantity_bought, :product_id) #
  end
end
