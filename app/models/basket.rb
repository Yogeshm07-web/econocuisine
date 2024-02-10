class Basket < ApplicationRecord
  has_many :products
  belongs_to :inventory
end
