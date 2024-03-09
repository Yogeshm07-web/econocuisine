class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :basket_items, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # attr_accessor :quantity_bought
  # Ensure that the necessary attributes are present
  validates :name, :description, :category, :price, :stock, :quantity_unit, presence: true
  scope :featured, -> { where(featured: true) }
  
end
