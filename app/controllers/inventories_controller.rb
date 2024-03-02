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
    @inventory.basket_id = 1
    
    if @inventory.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Render edit form
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
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_path, notice: 'Inventory item was successfully deleted.' }
    end
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
