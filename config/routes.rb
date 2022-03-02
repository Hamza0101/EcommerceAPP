Rails.application.routes.draw do
  resources :user
  resources :products do
    resources :reviews
  end

  devise_for :users

  root 'home#index'
end
