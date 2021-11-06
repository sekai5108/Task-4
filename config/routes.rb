Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
      resource :book_comments, only: [:create, :destroy]
  end

end