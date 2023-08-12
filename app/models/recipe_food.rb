class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  attr_accessor :food_name
end
