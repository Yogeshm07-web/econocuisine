class ProductController < ApplicationController

def index
  @products=Product.all
end

def create
  @product = Product.new(product_params)
  @product.save
  redirect_to product_path(@products)
end

def show
  @product = Product.find(params[:id])
end



def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  redirect_to product_path(@product)
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to product_path, status: :see_other
end

def product_params
  params.require(:product).permit(:id, :name, :description,:category,:price,:stock)
end
end
