Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  # Defines the root path route ("/")
  resources :recipes
end
