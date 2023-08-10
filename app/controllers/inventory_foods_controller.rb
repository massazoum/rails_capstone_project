class InventoryFoodsController < ApplicationController
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.build(inventory_food_params)

    if @inventory_food.save
      redirect_to inventory_show_path(@inventory), notice: 'Food added successfully.'
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_show_path(@inventory), notice: 'Food removed successfully.'
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
