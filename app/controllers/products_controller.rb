class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :le_wagon_supermarket, :add_to_basket]

  # Other controller actions...


  def index
    @products = Product.all
    if user_signed_in?
      @basket_items = current_user.basket_items.includes(:product)
    else
      @basket_items = []  # Assign an empty array if the user is not signed in
    end
  end


  def add_to_inventory(product_name, quantity)
    # This method should interact with your inventory system,
    # such as updating the quantity of a product in the database.
    # Ensure your inventory system is properly implemented and integrated here.
  end

  def create
    new_product = Product.new(product_params)

    if new_product.save
      redirect_to product_path(new_product), notice: 'Product was successfully created.'
    else
      render :new, alert: new_product.errors.full_messages.join(', ')
    end
  end

  def le_wagon_supermarket
    @products = Product.all
    @featured_products = Product.featured.limit(15)
    @categories = Category.all # Assuming Category is the model for categories
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

  # Other actions...

  private

  def set_product
    @product = Product.find_by(id: params[:id])

    if @product.nil?
      flash[:error] = "Product not found."
      redirect_to products_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :stock, :quantity)
  end
end
