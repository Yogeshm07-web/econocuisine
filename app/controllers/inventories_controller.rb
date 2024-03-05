class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:edit, :update, :destroy]
  before_action :load_products, only: [:index]

  def index
    @inventory_items = Inventory.all
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
       
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory item was successfully created.'
    else
      @inventory_items = Inventory.all  # Fetch all inventory items for rendering the index page
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
  end

  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventories_path, notice: 'Inventory item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path, notice: 'Inventory item was successfully deleted.'
  end

  def show
    redirect_to inventories_path
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :quantity) # Adjust permitted attributes as needed
  end
end
