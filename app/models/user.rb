class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basket, dependent: :destroy
  has_many :basket_items
  has_many :incomes
  has_many :expenses
  has_many :inventories, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
