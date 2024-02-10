class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  # GET /baskets
  def index
    @baskets = Basket.all
  end

  # GET /baskets/1
  def show
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  # POST /baskets
  def create
    @basket = Basket.new(basket_params)

    if @basket.save
      redirect_to @basket, notice: 'Basket was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /baskets/1
  def update
    if @basket.update(basket_params)
      redirect_to @basket, notice: 'Basket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /baskets/1
  def destroy
    @basket.destroy
    redirect_to baskets_url, notice: 'Basket was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def basket_params
      params.require(:basket).permit(:quantity_bought, :product_id)
    end
end
