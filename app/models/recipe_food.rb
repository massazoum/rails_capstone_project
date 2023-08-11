class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  attr_accessor :food_name 

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :recipe_id, presence: true
  validates :food_id, presence: true 

  before_validation :set_food_from_name 

  private

  def set_food_from_name
    self.food = Food.find_by(name: food_name)
  end
end
