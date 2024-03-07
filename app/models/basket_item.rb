class BasketItem < ApplicationRecord
  belongs_to :product
  belongs_to :basket

  # Define the total_price method to calculate the total price of the basket item
  def total_price
    return 0 if quantity.nil? || price.nil?

    quantity * price
  end
end
