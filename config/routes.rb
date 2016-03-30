Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products

  # You can have the root of your site routed with "root"
  root 'store#index', as: 'store'
  # ...
end
