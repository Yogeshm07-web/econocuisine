class Product < ApplicationRecord
  has_many :baskets
  has_many :order_items
end
