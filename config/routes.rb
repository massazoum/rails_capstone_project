Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users

  resources :recipes do
    member do
      get 'shopping_list', to: 'recipes#shopping_list'
    end
  end

  resources :inventories, only: [:index, :show, :destroy, :new, :create] do
    resources :foods, only: [:new, :create]
    resources :inventory_foods, only: [:new, :create, :destroy]
  end

  get '/inventories/:id', to: 'inventories#show', as: 'inventory_show'
    
end
