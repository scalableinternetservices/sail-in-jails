Rails.application.routes.draw do

  # ROOT
  root 'splash_screen#join'
  get '/join', to: 'splash_screen#join'
  get '/join/:id', to: 'splash_screen#join'

  # USER & SESSION
  get '/signup', to: 'users#new'
  
  get '/profile', to: 'splash_screen#profile'
  
  get '/edit_team/:id', to: 'teams#edit_team'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/profile', to: 'splash_screen#profile'

  # TEAM
  get '/teams/:id', to: 'teams#show'
  get '/create', to: 'teams#new'

  # COURSE
  get '/courses/create', to: 'courses#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
  resources :users
  resources :courses
end
