class Product < ApplicationRecord
  belongs_to :basket, optional: true
  end
