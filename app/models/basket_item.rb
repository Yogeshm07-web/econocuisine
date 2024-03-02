class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  belongs_to :price
end
