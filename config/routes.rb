Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :line_items
  resources :carts
  get 'store/index'
  resources :products do
    get :who_bought, on: :member
  end
  resources :products

  # You can have the root of your site routed with "root"
  root 'store#index', as: 'store'
  # ...
end
