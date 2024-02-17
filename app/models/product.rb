class Product < ApplicationRecord
  has_many :order_items
  has_one_attached :image

  # Ensure that the quantity unit and abbreviation are present
  # validates :quantity_unit, :quantity_unit_abbreviation, presence: true

  # No need to define custom methods for attribute access
  # You can directly access attributes using ActiveRecord's attribute methods
end
