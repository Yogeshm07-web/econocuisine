class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def index
    @basket = current_user.basket
    @basket_total = BasketItem.sum(:price)
    if @basket != nil 
      @total_price = @basket.basket_items.sum { |item| item.product.price * item.quantity }
    end
  end

  def create
    current_user.create_basket unless current_user.basket
    redirect_to baskets_path
  end

  def show
    @basket = current_user.basket
    if @basket
      @basket_items = @basket.basket_items.includes(:product)
    else
      @basket_items = []
    end
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
    @basket.destroy!
    redirect_to baskets_path, notice: 'Basket was successfully destroyed.'
  end

  def add_to_basket
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    # Ensure the current user has a basket
    user_basket = current_user.basket || current_user.create_basket

    # Directly create a new BasketItem for the user's basket
    basket_item = user_basket.basket_items.create(product: product, quantity: quantity)

    if basket_item.persisted?
      redirect_to le_wagon_supermarket_path, notice: "#{product.name} has been added to your basket."
    else
      redirect_to request.referer || products_path, alert: "Failed to add #{product.name} to your basket: #{basket_item.errors.full_messages.to_sentence}."
    end
  end

   
  # Action for a specific functionality, adjust as needed
  def le_wagon_supermarket
    @basket = current_user.basket || current_user.create_basket
    # Other code related to Le Wagon Supermarket
  end

  private

  def set_basket
    @basket = current_user.basket
  end

  def basket_params
    params.require(:basket).permit(:quantity_bought, :product_id)
  end
end