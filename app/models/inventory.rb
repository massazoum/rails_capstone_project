class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods

  def missing_food_items(recipe)
    missing_items = []

    # Iterate through the foods in the recipe
    recipe.foods.each do |recipe_food|
      inventory_food = inventory_foods.find_by(food_id: recipe_food.id)

      # If the food is missing or the quantity is insufficient
      next unless inventory_food.nil? || inventory_food.quantity < recipe_food.quantity

      missing_items << {
        food: recipe_food,
        missing_quantity: recipe_food.quantity - (inventory_food&.quantity || 0)
      }
    end

    missing_items
  end
end
