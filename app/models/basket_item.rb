class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product
  attribute :price, :decimal
end
