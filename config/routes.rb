Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :transactions
      resources :users
      resources :products
    end
  end
end
