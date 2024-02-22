class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basket
  has_many :basket_items, through: :baskets
  has_many :products, through: :basket_items
end
