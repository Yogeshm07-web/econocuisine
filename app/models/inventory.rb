class Inventory < ApplicationRecord
  belongs_to :user
  has_one :basket, foreign_key: "inventory_id"
end
