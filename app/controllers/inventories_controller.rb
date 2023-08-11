# app/controllers/inventories_controller.rb
class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: %i[show destroy]

  def index
    @inventories = current_user.inventories.all
  end

  def new
    @inventory = Inventory.new
  end

  def show
    # @inventory = Inventory.find(params[:id])
    # @recipe = Recipe.find(params[:recipe_id]) if params[:recipe_id]
    @inventory = Inventory.find(params[:id])
    @food = Food.new
    @foods = Food.joins(:inventory_foods).where(inventory_foods: { inventory_id: @inventory.id }).includes([:inventory_foods])

  end

  def food_list
    @inventory = Inventory.find(params[:id])
    @foods = @inventory.foods
  end

  def create
    @inventory = current_user.inventories.build(inventory_params)
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory.destroy if @inventory.user == current_user
    redirect_to inventories_path, notice: 'Inventory was successfully deleted.'
  end

  def shopping_list
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    @missing_foods = @recipe.foods - @inventory.foods

    @total_count = @missing_foods.count
    @total_price = @missing_foods.sum(&:price)
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
