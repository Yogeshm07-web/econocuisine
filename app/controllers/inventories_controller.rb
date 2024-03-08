class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:edit, :update, :destroy]

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
      @inventory_items = Inventory.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    # No need to find @inventory again, it's already set by before_action :set_inventory
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
    redirect_to inventories_path, notice: 'Inventory item was successfully deleted.'
  end

  private
  
  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :unit)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end
end
