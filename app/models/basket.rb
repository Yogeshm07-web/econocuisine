class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_unit, presence: true

  # Scopes
  scope :featured, -> { where(featured: true) }
end
