class Food < ApplicationRecord
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods

  validates :name, presence: true, length: { maximum: 50 }
end
