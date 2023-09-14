Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :groups
  resources :payments

  unauthenticated do
    root "users#welcome"
  end

  root 'groups#index', as: "categories"

  # Defines the root path route ("/")
end
