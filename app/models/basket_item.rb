class BasketItem < ApplicationRecord
  belongs_to :user
  belongs_to :basket
  belongs_to :product
end
