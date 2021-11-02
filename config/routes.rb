Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]

  resources :books, only: [:new, :create, :index, :show, :destroy]

  resources :favorites, onry: [:create, :destroy]

  resources :post_comments, only: [:create, :destroy]

end