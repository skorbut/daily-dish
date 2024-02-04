# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check

  resources :dishes do
    resources :favorite_dishes, only: %i[create destroy]
  end
  resources :cooked_dishes, only: %i[index create destroy]
  resources :favorite_dishes, only: :index
end
