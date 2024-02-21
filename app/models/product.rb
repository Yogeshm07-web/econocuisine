class Product < ApplicationRecord
  has_many :order_items
  has_one_attached :image
  belongs_to :category
  has_many :basket_items
  attr_accessor :quantity_bought
  # Ensure that the necessary attributes are present
  validates :name, :description, :category, :price, :stock, :quantity_unit, presence: true
  scope :featured, -> { where(featured: true) }
  # No need to define custom methods for attribute access
  # You can directly access attributes using ActiveRecord's attribute methods
end
