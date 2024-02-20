class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:edit, :update, :destroy]
  before_action :load_products, only: [:index]

  def index
    @inventory_items = Inventory.all
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path, notice: 'Inventory item was successfully added.' }
        format.js # Render create.js.erb
      else
        @inventory_items = Inventory.all
        format.html { render :index }
        format.js # Render create.js.erb
      end
    end
  end

 
  def update
    if @inventory.update(inventory_params)
      redirect_to inventories_path, notice: 'Inventory item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @inventory.destroy
    redirect_to inventories_path, notice: 'Inventory item was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def load_products
    @products = Product.all
  end

  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :user_id, :basket_id)
  end
end
