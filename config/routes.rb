Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  # Defines the root path route ("/")
  resources :inventories do
    resources :inventory_foods, only: %i[new create destroy]

    member do
      post 'create_food'
    end
    member do
      get 'shopping_list'
    end
  end

  resources :recipes do
    resources :recipe_foods, only: %i[new create destroy]
    resources :foods, only: [] do
      post 'create_for_recipe'
    end
    collection do
          get 'public_index', to: 'recipes#public_index'
        end
  end
get 'shopping_list', to: 'shopping_lists#index', as: :shopping_list
resources :foods, except: [:update]
end
