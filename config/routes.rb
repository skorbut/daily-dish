Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  namespace :webauthn do
    resources :credentials, only: %i[index create destroy] do
      collection do
        resource :challenge, only: %i[create], module: :credentials, as: :credentials_challenge
      end
    end

    resources :authentications, only: %i[index create], path: :auth do
      collection do
        resource :challenge, only: %i[create], module: :authentications, as: :authentications_challenge
      end
    end
  end

  resources :dishes
  resources :cooked_dishes
end
