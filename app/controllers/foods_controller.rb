class FoodsController < ApplicationController
    def new
      @inventory = current_user.inventories.find(params[:inventory_id])
      @food = @inventory.foods.new
    end
  
    def create
      @inventory = current_user.inventories.find(params[:inventory_id])
      @food = @inventory.foods.build(food_params)
  
      if @food.save
        redirect_to inventory_show_path(@inventory), notice: 'Food was successfully added.'
      else
        render :new
      end
    end
  
    private
  
    def food_params
      params.require(:food).permit(:food_id, :quantity)
    end
  end
  