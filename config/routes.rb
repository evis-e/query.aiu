Rails.application.routes.draw do
  resources :users
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  get 'users/new'
  get '/signup',  to: 'users#new'
end
