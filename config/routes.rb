Rails.application.routes.draw do

  root 'static_pages#home'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  get '/users/new'
  get '/posts/new'

  get '/signup',  to: 'users#new'

  resources :users
  resources :posts, only: [:create, :destroy]
end
