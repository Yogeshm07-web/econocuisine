class Basket < ApplicationRecord
  belongs_to :product
  has_many :inventories
end
