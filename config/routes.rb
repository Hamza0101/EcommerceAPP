Rails.application.routes.draw do
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  post 'line_items' => 'line_items#create'
  get 'line_items/:id' => 'line_items#show', as: 'line_item'
  delete 'line_items/:id' => 'line_items#destroy'
  resources :carts
  resources :line_items
  resources :orders
  resources :user
  resources :products do
    resources :reviews
  end

  devise_for :users

  root 'home#index'
end
