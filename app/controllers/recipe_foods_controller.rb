# app/controllers/recipe_foods_controller.rb
class RecipeFoodsController < ApplicationController
  def new
    @recipe_name = Recipe.find(params[:recipe_id]).name
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe_foods = RecipeFood.new(recipe_foods_params)
    @recipe_foods.recipe_id = params[:recipe_id]

    if @recipe_foods.save
      redirect_to "/recipes/#{params[:recipe_id]}"
    else
      render :new, status: 422
    end
  end

  def destroy
    @recipe = RecipeFood.find_by(food_id: params[:id], recipe_id: params[:recipe_id])
    p @recipe.recipe_id 
    p @recipe.food_id
    if @recipe.destroy
      redirect_to(request.referrer || root_path)
    else
      flash[:error] = 'error'
    end
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity )
  end
end
