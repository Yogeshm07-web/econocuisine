class Inventory < ApplicationRecord
  belongs_to :user
  belongs_to :basket
end
