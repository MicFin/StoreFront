Storefront::Application.routes.draw do
  get "main/index"
  devise_for :users
  #root 'products#index'
  root 'main#index'
  resources :products, only: [:index, :show, :create]
  resources :orders, only: [:new, :create]
  post '/products/:product_id/add_to_cart', to: 'line_items#create', as: 'add_product_to_cart'
  get '/cart', to: 'line_items#index', as: 'cart'
  delete '/cart/:id', to: 'line_items#delete', as: 'remove_product_from_cart'
end
