class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created successfully'
    else
      render :new
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :user_id, :basket_id)
  end
end
