class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :le_wagon_supermarket, :add_to_basket]

  def index
    # Check if the user is signed in before fetching basket items
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
    # Find the product based on the product_id passed in params
    product = Product.find(params[:product_id])

    # Check if the current user has a basket, create one if not
    unless current_user.basket
      current_user.create_basket
    end

    # Add the product to the user's basket
    basket_item = current_user.basket.basket_items.build(product: product)

    if basket_item.save
      redirect_to baskets_path, notice: "#{product.name} has been added to your basket."
    else
      redirect_to products_path, alert: "Failed to add #{product.name} to your basket."
    end
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
