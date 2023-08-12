class Food < ApplicationRecord
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods

  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true
end
