class Inventory < ApplicationRecord
  belongs_to :user
  has_one :basket
end
