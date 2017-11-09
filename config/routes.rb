Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users
  resources :authentication, only: [:create], path: :auth

  resources :products
end
