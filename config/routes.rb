Rails.application.routes.draw do
  root 'forum#index'

  get '/help', to: 'forum#index', name: "forum"
  resources :users
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  resources :snapshots do
    resources :comments, only: [:create, :update, :destroy, :edit]
  end
  resources :snapshots, only: [:create, :destroy]
end

