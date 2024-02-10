class Inventory < ApplicationRecord
  belongs_to :user
  has_ many :products
end
