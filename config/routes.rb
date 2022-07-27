Rails.application.routes.draw do
  
  resources :orders do 
    resources :comments do 
      get 'like', to: 'likes#create'
      delete 'dislike', to: 'likes#destroy'
      # delete '/orders/:order_id/comments/:comment_id/likes/:id' => 'likes#destroy'
      # resources :likes, only: %i[new create destroy]
    end
  end
  devise_for :users
  root 'home#index'
  get 'my_order', to: 'orders#my_orders'
  get 'search_order', to: 'orders#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
