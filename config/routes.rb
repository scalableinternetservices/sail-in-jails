Rails.application.routes.draw do
  get 'sessions/new'
  root 'splash_screen#join'

  get '/show', to: 'teams#show'
  get '/courses', to: 'courses#new'
  get '/join', to: 'splash_screen#join'
  get '/join/:id', to: 'splash_screen#join'

  get '/signup', to: 'users#new'
  get '/profile', to: 'users#profile'
  
  get '/edit_team/:id', to: 'teams#edit_team'
  get '/edit_profile/:id', to: 'users#edit_profile'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  get '/create', to: 'teams#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
  resources :users
  resources :courses
end
