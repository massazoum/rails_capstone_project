class RecipesController < ApplicationController
  # def new
  #   @recipe = Recipe.new
  #   @foods = Food.all
  # end

  # def create
  #   @recipe = current_user.recipes.build(recipe_params)
  #   if @recipe.save
  #     # Handle successful save
  #   else
  #     # Handle validation errors
  #   end
  # end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def shopping_list
    @inventory = current_user.inventories.find(params[:inventory_id])
    @recipe = Recipe.find(params[:id])
    @missing_food_items = @inventory.missing_food_items(@recipe)
  end
end
