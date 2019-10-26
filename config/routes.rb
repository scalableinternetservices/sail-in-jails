Rails.application.routes.draw do
  root 'splash_screen#join'

  get '/show', to: 'teams#show'
  get '/join', to: 'splash_screen#join'
  get '/create', to: 'splash_screen#create'
  get '/signup', to: 'users#new'

  # FIXME: Need to change path later.
  get 'teams/new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams
  resources :users
end
