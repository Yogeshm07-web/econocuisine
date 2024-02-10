class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created successfully'
    else
      render :new
    end
  end
  def update
    if @inventory.update(inventory_params)
      redirect_to @inventory, notice: 'Inventory was successfully updated.'
    else
      render :edit
    end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :user_id, :basket_id)
  end
end
end
