class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :le_wagon_supermarket, :add_to_basket]

  # Other controller actions...

  def index
    @basket_items = current_user.basket_items.includes(:product) if user_signed_in?
    @products = Product.all # Fetch all products
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
    @products = Product.all # Fetch all products for display on the supermarket page
  end

  def add_to_basket
    # Find the product based on the product_id passed in params
    product = Product.find(params[:product_id])

    # Add the product to the user's basket (assuming current_user is available)
    basket_item = current_user.basket_items.build(product: product)

    if basket_item.save
      redirect_to products_path, notice: "#{product.name} has been added to your basket."
    else
      redirect_to products_path, alert: "Failed to add #{product.name} to your basket."
    end
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
