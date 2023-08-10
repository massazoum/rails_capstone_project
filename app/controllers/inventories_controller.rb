class InventoriesController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @inventories = current_user.inventories
    end
  
    def new
      @inventory = Inventory.new
    end
  
    def create
      @inventory = current_user.inventories.new(inventory_params)
  
      if @inventory.save
        redirect_to inventories_path, notice: 'Inventory was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @inventory = current_user.inventories.includes(inventory_foods: :food).find(params[:id])
      @inventory_food = @inventory.inventory_foods.new
    end
    
    
    def destroy
      @inventory = current_user.inventories.find(params[:id])
      @inventory.destroy
      redirect_to inventory_path, notice: 'Inventory was successfully deleted.'
    end
  
    private

def inventory_params
  params.require(:inventory).permit(:name, :description)
end

  end
  