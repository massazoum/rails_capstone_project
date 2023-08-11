class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, class_name: 'RecipeFood'
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :cooking_time, presence: true
end
