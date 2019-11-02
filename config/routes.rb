Rails.application.routes.draw do
  get 'sessions/new'
  root 'splash_screen#join'

  get '/show', to: 'teams#show'
  get '/courses', to: 'courses#new'
  get '/join', to: 'splash_screen#join'
  get '/create', to: 'splash_screen#create'
  get '/signup', to: 'users#new'
  get '/profile', to: 'splash_screen#profile'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # FIXME: Need to change path later.
  get 'teams/new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
  resources :users
  resources :courses
end
