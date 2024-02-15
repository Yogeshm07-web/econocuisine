
class ProductController < ApplicationController
  before_action :set_product,except: :index
  def index
    @products=Product.all
  end
  def index
    @products = Product.all
  end

  def add_to_inventory
    product = Product.find(params[:id])
    # You can add logic here to add the selected product to the inventory
    redirect_to inventories_path, notice: "#{product.name} was successfully added to inventory."
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :category, :price, :stock, :url)
    end
end
