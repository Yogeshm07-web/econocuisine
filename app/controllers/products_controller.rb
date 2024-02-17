class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :add_to_inventory, :new, :create, :le_wagon_supermarket]

  # Other controller actions...

  def index
    @basket_items = current_user.basket_items.includes(:product) if user_signed_in?
    # Other logic for fetching products
  end

  def add_to_inventory
    # Implementation for adding products to inventory
    # This action is already implemented in your code
  end

  def create
    # Implementation for creating a new product
    # Make sure to set the product properly
  end

  def le_wagon_supermarket
    @products = Product.all # Fetch products to display
    # Additional logic for the "Le Wagon Super Market" page
  end

  # Other actions...

  private

  def set_product
    # Implementation for setting the product
    # This action is already implemented in your code
  end

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :stock, :quantity)
  end
end
