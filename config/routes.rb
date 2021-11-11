Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users

  resources :users do
    resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member

  end

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
      resource :book_comments, only: [:create, :destroy]
  end

end