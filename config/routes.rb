Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :dishes do
    resources :favorite_dishes, only: %i[create destroy]
  end
  resources :cooked_dishes
  resources :favorite_dishes, only: :index
end
