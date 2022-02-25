Rails.application.routes.draw do
  resources :orders
  devise_for :users
  root 'home#index'
  get 'my_order', to: 'orders#my_orders'
  get 'search_order', to: 'orders#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
