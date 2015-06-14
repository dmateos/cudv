Rails.application.routes.draw do
  mount API => "/"
  
  root to: "pages#index"

  resources :users, only: [:index]
  resources :products, only: [:index]
  resources :orders, only: [:index]
end
