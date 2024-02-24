class BasketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def index
    @basket = Basket.where(user: current_user)
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
    pro = Product.find(params[:id])
    basket = Basket.new(user: current_user)
    basket.product_id = pro.id
    if basket.save
      puts "Basket item successfully saved: #{basket.inspect}"
      redirect_to le_wagon_supermarket_path, notice: "#{pro.name} has been added to your basket."
    else
      puts "Failed to save basket item: #{basket_item.errors.full_messages}"
      redirect_to request.referer || products_path, alert: "Failed to add #{product.name} to your basket."
    end
    
    product = Product.find(params[:product_id])
    quantity = params[:quantity_bought].to_i
    basket_item = { product_id: product.id, quantity: quantity }
    session[:basket] ||= []
    session[:basket] << basket_item
    redirect_to basket_display_path

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
