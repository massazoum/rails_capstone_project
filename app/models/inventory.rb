class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, class_name: 'InventoryFood'
  has_many :foods, through: :inventory_foods
end
