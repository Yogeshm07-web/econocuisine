class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:edit, :update, :destroy]
  before_action :set_products, only: [:index]

  def index
    @inventory_items = Inventory.all
    @inventory = Inventory.new # Initialize a new inventory instance for the form
  end

  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path, notice: 'Inventory item was successfully added.' }
        format.js # This will render create.js.erb
      else
        @inventory_items = Inventory.all
        format.html { render :index }
        format.js # This will render create.js.erb
      end
    end
  end

  def edit
    # The inventory item to be edited is already set by the before_action
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

  def set_products
    @products = Product.all # Assuming you have a Product model and want to display all products in the dropdown
  end

  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :user_id, :basket_id)
  end
end
