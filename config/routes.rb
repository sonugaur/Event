Rails.application.routes.draw do
  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  root   'static_pages#home'
  get 'events/index'
  get    '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  # delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :events,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy] 
    
end
