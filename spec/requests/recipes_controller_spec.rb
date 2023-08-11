require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  let(:user) { User.new(name: 'Brian', email: 'bb@test.com', password: 'password') }

  before do
    user.save
  end

  def authenticate_user(user)
    post user_session_path, params: { user: { email: user.email, password: user.password, name: user.name } }
    follow_redirect!
  end

  describe 'Recipes' do
    describe 'GET #index' do
      it 'returns a success response if user is authenticated' do
        authenticate_user(user)
        get user_recipes_path(user.id)
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      let(:recipe) do
        Recipe.create(name: 'Soup', preparation_time: '30 mins', cooking_time: '30 mins',
                      description: 'Soup', public: false,
                      user_id: user.id)
      end

      it 'returns a success response' do
        authenticate_user(user)
        get user_recipe_path(user.id, recipe)
        expect(response).to be_successful
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        authenticate_user(user)
        get new_user_recipe_path(user.id)
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      it 'should create a new Recipe' do
        authenticate_user(user)
        expect do
          post "/users/#{user.id}/recipes",
               params: {
                 recipe: {
                   name: 'Vanina',
                   preparation_time: '30 mins',
                   cooking_time: '30 mins',
                   description: 'Fried',
                   public: false,
                   user_id: user.id
                 }
               }
        end.to change(Recipe, :count).by(1)
      end
    end

    describe 'GET #destroy' do
      let!(:recipe) do
        Recipe.create(name: 'recipe', preparation_time: '10 mins', cooking_time: '20 mins',
                      description: 'Vanina', public: false,
                      user_id: user.id)
      end

      it 'should destroy the recipe' do
        authenticate_user(user)
        expect do
          delete "/users/#{user.id}/recipes/#{recipe.id}"
        end.to change(Recipe, :count).by(-1)
      end

      it 'should redirect to the recipes list' do
        authenticate_user(user)
        delete "/users/#{user.id}/recipes/#{recipe.id}"
        expect(response).to redirect_to(user_recipes_path)
      end
    end

    describe 'GET #toggle_public' do
      let!(:recipe) do
        Recipe.create(name: 'Vanina', preparation_time: ' 10 mins', cooking_time: '20 mins',
                      description: 'Fried', public: false,
                      user_id: user.id)
      end
    end

    describe 'GET #shopping_list' do
      let!(:recipe) do
        Recipe.create(name: 'Vanina', preparation_time: '10 mins', cooking_time: '20 mins',
                      description: 'Fried', public: false,
                      user_id: user.id)
      end
    end
  end
end