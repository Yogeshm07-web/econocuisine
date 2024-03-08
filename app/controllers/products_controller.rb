class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /le_wagon_supermarket
  def le_wagon_supermarket
    @product ||= Product.new
    @products = Product.all
  end
  

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def add_to_basket
    @product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    current_user.basket.products << @product
    redirect_to le_wagon_supermarket_path, notice: 'Product added to basket successfully.'
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity_unit, :image)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :category, :price, :stock, :quantity_unit, :featured)
    end
end