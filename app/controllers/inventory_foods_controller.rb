# app/controllers/inventory_foods_controller.rb
class InventoryFoodsController < ApplicationController
 def new
   @inventory_name = Inventory.find(params[:inventory_id]).name
   @inventory_foods = InventoryFood.new
 end

 def create
   @inventory_foods = InventoryFood.new(inventory_foods_params)
   @inventory_foods.inventory_id = params[:inventory_id]
   if @inventory_foods.save
     redirect_to "/inventories/#{params[:inventory_id]}"
   else
     render :new, status: 422
   end
 end

 def destroy
   @inventory = InventoryFood.find_by(food_id: params[:id], inventory_id: params[:inventory_id])
   p @inventory.inventory_id 
   p @inventory.food_id
   if @inventory.destroy
     redirect_to(request.referrer || root_path)
   else
     flash[:error] = 'Error'
   end
 end

 private

 def inventory_foods_params
   params.require(:inventory_food).permit(:food_id, :quantity)
 end
end
