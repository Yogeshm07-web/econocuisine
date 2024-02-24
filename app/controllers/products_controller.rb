class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :le_wagon_supermarket, :add_to_basket]

  def index

    # Check if the user is signed in before fetching basket items

    @products = Product.all

    if user_signed_in?
      @basket_items = current_user.basket_items.includes(:product)
    else
      @basket_items = []  # Assign an empty array if the user is not signed in
    end
  end

  def create
    new_product = Product.new(product_params)

    if new_product.save
      redirect_to product_path(new_product), notice: 'Product was successfully created.'
    else
      # Use flash instead of render for errors
      flash.now[:alert] = new_product.errors.full_messages.join(', ')
      render :new
    end
  end

  def le_wagon_supermarket
    # Fetch all products, featured products, and categories for display
    @products = Product.all
    @featured_products = Product.featured.limit(15)
    @categories = Category.all
  end

  def add_to_basket
    product = Product.find(params[:product_id])
    quantity = params[:quantity_bought].to_i
    basket_item = { product_id: product.id, quantity: quantity }
    session[:basket] ||= []
    session[:basket] << basket_item
    redirect_to basket_display_path
  end
  def basket_display
    @basket_items = session[:basket] || []
  end

  private

  def set_product
    # Find the product by ID, handle the case where it's not found
    @product = Product.find_by(id: params[:id])

    if @product.nil?
      flash[:error] = "Product not found."
      redirect_to products_path
    end
  end

  def product_params
    # Permit the necessary parameters for product creation
    params.require(:product).permit(:name, :description, :category, :price, :stock, :quantity)
  end
end
