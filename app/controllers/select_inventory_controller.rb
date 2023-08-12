class SelectInventoryController < ApplicationController
 def update_inventory
  inventory_id = params[:inventory_id]
  recipe_id = params[:recipe_id]
  redirect_to '/shopping_list'
  end
end