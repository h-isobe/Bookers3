Rails.application.routes.draw do

  root 'home#index'
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'follower/:id' => 'relationships#follower', as: 'follower'
  get 'followed/:id' => 'relationships#followed', as: 'followed'
  get "search" => "books#search"
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
end
