Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users
  post 'invite', to: 'friendships#create'
  put 'accept_request', to: 'users#update'
  delete 'reject', to: 'users#delete'
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
