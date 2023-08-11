# app/controllers/shopping_lists_controller.rb
class ShoppingListsController < ApplicationController
  def index
    @inventory_foods = InventoryFood.all
    @recipe_foods = RecipeFood.all

    @recipe_id = params[:recipe_id]
    @inventory_id = params[:inventory_id]
  end
end
