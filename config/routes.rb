Rails.application.routes.draw do

  root 'home#index'
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end