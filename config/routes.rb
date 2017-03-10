Rails.application.routes.draw do

  root to: 'users#index'

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create', as: 'create_user'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'

end
